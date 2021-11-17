//
//  RobotService.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Foundation
import GRPC

class RobotClientImpl : RobotClient {
//    @Injected var client: Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient
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
