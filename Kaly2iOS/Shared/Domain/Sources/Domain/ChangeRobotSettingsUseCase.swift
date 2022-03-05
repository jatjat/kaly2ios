//
//  ChangeRobotSettingsUseCase.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2022-02-19.
//

import Foundation
import DataAPI

public protocol ChangeRobotSettingsUseCase {
     func execute(robotSessionID: Int64, shouldRun: Bool) async throws
}

class ChangeRobotSettingsUseCaseImpl: ChangeRobotSettingsUseCase {
    let sessionClient: SessionClient
    
    init(sessionClient: SessionClient) {
        self.sessionClient = sessionClient
    }
    
    func execute(robotSessionID: Int64, shouldRun: Bool) async throws {
        try await sessionClient.modifySessionSettings(robotSessionID: robotSessionID, shouldRun: shouldRun)
    }
}
