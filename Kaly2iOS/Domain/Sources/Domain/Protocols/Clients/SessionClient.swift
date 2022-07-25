//
//  SessionClient.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import Foundation

/// @mockable
public protocol SessionIterator {
    mutating func next() async throws -> SubscribeResponseEntity?
}

/// @mockable
public protocol SessionClient {
    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator

    func getPastIterations(robotSessionID: Int64, firstIterationNo: Int64) async throws -> [IterationEntity]

    func modifySessionSettings(robotSessionID: Int64, shouldRun: Bool) async throws

    func modifySlamSettings(robotSessionID: Int64, numParticles: Int32, sensorAngVar: Float, sensorDistVar: Float) async throws
}
