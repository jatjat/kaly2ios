//
//  DomainTests.swift
//  DomainTests
//
//  Created by Joel Thiessen on 2022-02-19.
//

@testable import Domain
import DomainMocks
import XCTest

class DomainTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangeRobotSettingsUseCase() async throws {
        // GIVEN
        let mock = SessionClientMock()
        mock.modifySessionSettingsHandler = { sessionID, shouldRun in
            XCTAssertEqual(sessionID, 99)
            XCTAssertEqual(shouldRun, false)
        }
        let use = ChangeRobotSettingsUseCaseImpl(sessionClient: mock)

        // WHEN
        try await use.execute(robotSessionID: 99, shouldRun: false)

        // THEN
        XCTAssertEqual(mock.modifySessionSettingsCallCount, 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
