//
//  SessionClient.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import Foundation

public protocol SessionIterator {
    mutating func next() async throws -> SubscribeResponse?
}

public protocol SessionClient {
    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator

    func modifySessionSettings(robotSessionID: Int64, shouldRun: Bool) async throws

    func modifySlamSettings(robotSessionID: Int64, numParticles: Int32, sensorAngVar: Float, sensorDistVar: Float) async throws
}
