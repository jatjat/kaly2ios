//
//  MapViewModelTests.swift
//  presentation-tests
//
//  Created by Joel Thiessen on 2022-04-20.
//

import Combine
import Domain
import DomainMocks
import Foundation
@testable import Presentation
// import SwiftUI
// import TestData
import XCTest

class MapViewTests: XCTestCase {
    var sut: MapViewModel!
    var cancellables = Set<AnyCancellable>()

    func esttestPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testMapAgain() async throws {
        // GIVEN
        var itrCalls = 0
        let sessionClient = SessionClientMock()
        sessionClient.subscribeNewHandler = { _, _ in
            let itr = SessionIteratorMock()
            itr.nextHandler = {
                if itrCalls > 0 {
                    try await Task.sleep(nanoseconds: 100_000_000)
                }
                itrCalls += 1
                let pose = PoseEntity(x: 1, y: 2, heading: 3)
                return try SubscribeResponseEntity(robotSessionID: 0, iteration: IterationEntity(bestPose: pose, odoPose: pose, truePose: pose))
            }
            return itr
        }
        let useCase = SeeMapUseCaseImpl(robotClient: RobotClientMock(), mapClient: MapClientMock(), sessionClient: sessionClient, openRobotSessionRepo: OpenRobotSessionRepoMock(), lastErrorTimeRepo: LastErrorTimeRepoMock())
        sut = MapViewModel(updateMapUseCase: useCase)

        // WHEN
        await sut.onAppear()

        // THEN
        let pose = await sut.$truePoses
            .secondAsync()?
            .first

        let uPose = try XCTUnwrap(pose)
        XCTAssertEqual(uPose.x, 1)
        XCTAssertEqual(uPose.y, 2)
        XCTAssertEqual(uPose.heading, 3)
    }
}

extension Published.Publisher {
    func firstAsync() async -> Published<Value>.Publisher.Output? {
        await AsyncPublisher(self)
            .first(where: { _ in true })
    }

    func secondAsync() async -> Published<Value>.Publisher.Output? {
        await AsyncPublisher(self)
            .dropFirst()
            .first(where: { _ in true })
    }
}
