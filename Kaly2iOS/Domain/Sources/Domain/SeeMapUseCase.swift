//
//  SeeMapUseCase.swift
//  domain
//
//  Created by Joel Thiessen on 2022-07-22.
//

import Foundation

public struct UpdateMapUseCaseResult: Sendable {
    public let bestPoses: [PoseEntity]
    public let odoPoses: [PoseEntity]
    public let truePoses: [PoseEntity]
}

public struct SubscribeResponseEntity {
    let robotSessionID: Int64
    let iteration: IterationEntity

    public init(robotSessionID: Int64, iteration: IterationEntity) throws {
        self.robotSessionID = robotSessionID
        self.iteration = iteration
    }
}

public struct PoseEntity: Sendable {
    public let x: Float
    public let y: Float
    public let heading: Float

    public init(x: Float, y: Float, heading: Float) {
        self.x = x
        self.y = y
        self.heading = heading
    }
}

public struct IterationEntity {
    let bestPose: PoseEntity
    let odoPose: PoseEntity
    let truePose: PoseEntity

    public init(bestPose: PoseEntity, odoPose: PoseEntity, truePose: PoseEntity) throws {
        self.bestPose = bestPose
        self.odoPose = odoPose
        self.truePose = truePose
    }
}

public struct OpenRobotSessionEntity {
    let robotSessionItr: SessionIterator
    var storedItrs: [IterationEntity]
}

/// @mockable
public protocol OpenRobotSessionRepo {
    func get() -> OpenRobotSessionEntity?
    func save(_: OpenRobotSessionEntity?)
}

/// @mockable
public protocol LastErrorTimeRepo {
    func get() -> Date?
    func save(_: Date?)
}

enum SeeMapUseCaseErrors: Error {
    case noIteration
}

/// @mockable
public protocol SeeMapUseCase {
    func execute() async throws -> UpdateMapUseCaseResult
}

// Implementation is public too besides the protocol,
// to allow previewing with real domain logic:
public class SeeMapUseCaseImpl: SeeMapUseCase {
    let retryWaitTime: TimeInterval = 5
    let robotClient: RobotClient
    let mapClient: MapClient
    let sessionClient: SessionClient
    let openRobotSessionRepo: OpenRobotSessionRepo

    public init(robotClient: RobotClient, mapClient: MapClient, sessionClient: SessionClient, openRobotSessionRepo: OpenRobotSessionRepo, lastErrorTimeRepo _: LastErrorTimeRepo) {
        self.robotClient = robotClient
        self.mapClient = mapClient
        self.sessionClient = sessionClient
        self.openRobotSessionRepo = openRobotSessionRepo
    }

    private func getRobotSession() async throws -> OpenRobotSessionEntity {
        // Try to resume a session; if not, make one:
        guard let ses = openRobotSessionRepo.get() else {
            let robotID = try await robotClient.createRobot(robotName: "robotNameForiOS", isReal: false)
            let mapID = try await mapClient.createMap(mapName: "mapNameForiOS")

            let itr = try await sessionClient.subscribeNew(robotID: robotID, mapID: mapID)
            let ses = OpenRobotSessionEntity(robotSessionItr: itr, storedItrs: [])
            openRobotSessionRepo.save(ses)
            return ses
        }
        return ses
    }

    public func execute() async throws -> UpdateMapUseCaseResult {
        var ses = try await getRobotSession()
        var itr = ses.robotSessionItr
        let res = try await itr.next()
        guard let itr: IterationEntity = res?.iteration else {
            // An empty iteration means robot session has ended on the server:
            openRobotSessionRepo.save(nil)
            // The server should never end a robot session except in exceptional
            // circumstances:
            throw SeeMapUseCaseErrors.noIteration
        }

        ses.storedItrs.append(itr)
        openRobotSessionRepo.save(ses)

        let bestPoses = ses.storedItrs.map(\.bestPose)
        let odoPoses = ses.storedItrs.map(\.odoPose)
        let truePoses = ses.storedItrs.map(\.truePose)
        return UpdateMapUseCaseResult(bestPoses: bestPoses, odoPoses: odoPoses, truePoses: truePoses)
    }
}
