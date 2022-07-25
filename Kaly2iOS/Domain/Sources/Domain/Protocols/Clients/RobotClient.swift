//
//  RobotClient.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Foundation

/// @mockable
public protocol RobotClient {
    func createRobot(robotName: String, isReal: Bool) async throws -> Int64
}
