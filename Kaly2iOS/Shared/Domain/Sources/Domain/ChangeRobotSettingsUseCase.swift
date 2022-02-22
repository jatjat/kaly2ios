//
//  ChangeRobotSettingsUseCase.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2022-02-19.
//

import Foundation
#if os(macOS)
import DataMacOSAPI
#else
import DataIOSAPI
#endif

protocol PChangeRobotSettingsUseCase {
     func execute(robotSessionID: Int64, shouldRun: Bool) async throws
}

class ChangeRobotSettingsUseCase: PChangeRobotSettingsUseCase {
    let sessionClient: SessionClient
    
    init(sessionClient: SessionClient) {
        self.sessionClient = sessionClient
    }
    
    func execute(robotSessionID: Int64, shouldRun: Bool) async throws {
        try await sessionClient.modifySessionSettings(robotSessionID: robotSessionID, shouldRun: shouldRun)
    }
}
