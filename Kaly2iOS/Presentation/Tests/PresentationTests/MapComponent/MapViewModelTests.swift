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

    func esttestPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testMapAgain() async throws {
        // GIVEN
        let sessionClient = SessionClientMock()
//        let sessionClient = StubSessionClient()
//        sessionClient.subscribeNewCallback = {
//            let itr = StubSessionIterator()
//            itr.nextCallback = {
//                SubscribeResponse()
//            }
//        }
//        sut = await MapViewModel(updateMapUseCase: UpdateMapUseCase())

        // WHEN
        let useCase = SeeMapUseCase(robotClient: RobotClientMock(), mapClient: MapClientMock(), sessionClient: sessionClient, openRobotSessionRepo: OpenRobotSessionRepoMock(), lastErrorTimeRepo: LastErrorTimeRepoMock())
        sut = MapViewModel(updateMapUseCase: useCase)

        // THEN
        sut.onAppear()

//        XCTAssertEqual(next?.first?.x, 0)
    }
}

// class StubSessionIterator: SessionIterator {
//    var nextCallback: () -> SubscribeResponse? = {
//        nil
//    }
//    func next() async throws -> SubscribeResponse? {
//        nextCallback()
//    }
// }
//
// class StubSessionClient: SessionClient {
//    var subscribeNewCallback: () -> SessionIterator = {
//        return StubSessionIterator()
//    }
//
//    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator {
//        subscribeNewCallback()
//    }
//
//    func modifySessionSettings(robotSessionID: Int64, shouldRun: Bool) async throws {
//
//    }
//
//    func modifySlamSettings(robotSessionID: Int64, numParticles: Int32, sensorAngVar: Float, sensorDistVar: Float) async throws {
//
//    }
// }

// PreviewData().real.sessionClient
