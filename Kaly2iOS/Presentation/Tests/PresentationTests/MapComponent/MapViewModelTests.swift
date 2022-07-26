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

    func testMapAgain() throws {
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
                let pose = PoseEntity(x: 0, y: 0, heading: 0)
                return try SubscribeResponseEntity(robotSessionID: 0, iteration: IterationEntity(bestPose: pose, odoPose: pose, truePose: pose))
            }
            return itr
        }
        let useCase = SeeMapUseCaseImpl(robotClient: RobotClientMock(), mapClient: MapClientMock(), sessionClient: sessionClient, openRobotSessionRepo: OpenRobotSessionRepoMock(), lastErrorTimeRepo: LastErrorTimeRepoMock())
        sut = MapViewModel(updateMapUseCase: useCase)
        let expectation = XCTestExpectation(description: "Publishes true pose")

        // WHEN
        sut.onAppear()

        // THEN
        sut.$truePoses
            .dropFirst()
            .sink {
                XCTAssertNotNil($0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5)
    }
}
