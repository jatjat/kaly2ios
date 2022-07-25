//
//  UpdateMapUseCase.swift
//  domain
//
//  Created by Joel Thiessen on 2022-07-22.
//

import Foundation

//
//  SubscribeResponse.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import Foundation

// public protocol ParticleData {
//    var x: Float { get }
//    var y: Float { get }
//    var heading: Float { get }
// }
//
// public protocol FeatureData {
//    var x: Float { get }
//    var y: Float { get }
// }
//
// public protocol PoseData {
//    var x: Float { get }
//    var y: Float { get }
//    var heading: Float { get }
// }
//
// public protocol SlamSettingsData {
//    var numParticles: Int32 { get }
//    var sensorDistVar: Float { get }
//    var sensorAngVar: Float { get }
// }
//
// public protocol SessionSettingsData {
//    var isRunning: Bool { get }
// }
//
// public protocol IterationData {
//    var bestPose: PoseData { get }
//    var odoPose: PoseData { get }
//    var truePose: PoseData { get }
//    var features: [FeatureData] { get }
//    var particles: [ParticleData] { get }
//    var slamSettings: SlamSettingsData { get }
//    var sessionSettings: SessionSettingsData { get }
// }
//
///// @mockable
// public protocol SubscribeResponseData {
//    var robotSessionID: Int64 { get }
//    var iteration: IterationEntity { get }
// }

public struct UpdateMapUseCaseResult {
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

public struct PoseEntity {
    let x: Float
    let y: Float
    let heading: Float

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

public class SeeMapUseCase {
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
        // try to resume a session, if not make one:
        guard let ses = openRobotSessionRepo.get() else {
            let robotID = try await robotClient.createRobot(robotName: "foriOS", isReal: false)
            let mapID = try await mapClient.createMap(mapName: "foriOS")

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
            // an empty iteration means robot session has ended on the server:
            openRobotSessionRepo.save(nil)
            // the server should never end a robot session except in exceptional
            // circumstances:
            throw SeeMapUseCaseErrors.noIteration
        }

        ses.storedItrs.append(itr)
        openRobotSessionRepo.save(ses)

        let bestPoses = ses.storedItrs.map(\.bestPose)
        let odoPoses = ses.storedItrs.map(\.odoPose)
        let truePoses = ses.storedItrs.map(\.truePose)
        return UpdateMapUseCaseResult(bestPoses: bestPoses, odoPoses: odoPoses, truePoses: truePoses)

//        return UpdateMapUseCaseResult(bestPoses: bestPoses, odoPoses: [UIPose(pose: itr.odoPose)], truePoses: [UIPose(pose: itr.truePose)])

        ////        if counter > 2 {
        ////            try await Task.sleep(nanoseconds: 100_000_000)
        ////        }
//        var bestPoses = [UIPose]()
        ////        for i in 1 ..< Int.random(in: 1 ..< 10) {
        ////            bestPoses.append(UIPose(x: Float(i), y: Float(i), heading: Float(i)))
        ////        }
        ////        counter += 1
//        return UpdateMapUseCaseResult(bestPoses: bestPoses, odoPoses: [], truePoses: [])
    }
}