//
//  RobotService.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Domain
import Foundation
import GRPC
import NIOCore

class RobotClientImpl: RobotClient {
    let client: Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient

    init(client: Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient) {
        self.client = client
    }

    func createRobot(robotName: String, isReal: Bool) async throws -> Int64 {
        var req = Ca_Joelathiessen_Kaly2_Proto_CreateRobotRequest()
        req.robotName = robotName
        req.isReal = isReal
        return try await client.createRobot(req).robotID
    }
}
