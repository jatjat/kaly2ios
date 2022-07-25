//
//  SessionClientImpl.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-01.
//

import Domain
import Foundation
import GRPC

struct SessionIteratorImpl: SessionIterator {
    private var inner: GRPCAsyncResponseStream<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>.Iterator
    mutating func next() async throws -> SubscribeResponseEntity? {
        let resp = try await inner.next()
        return try resp.flatMap { try SubscribeResponseEntity(grpcResp: $0) }
    }

    init(inner: GRPCAsyncResponseStream<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>.Iterator) {
        self.inner = inner
    }
}

class SessionClientImpl: SessionClient {
    let client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient

    init(client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient) {
        self.client = client
    }

    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator {
        var req = Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest()
        req.robotID = robotID
        req.mapID = mapID

        let inner = client.subscribeNew(req).makeAsyncIterator()

        return SessionIteratorImpl(inner: inner)
    }

    func subscribeExisting(robotSessionID: Int64) async throws -> SessionIterator {
        var req = Ca_Joelathiessen_Kaly2_Proto_SubscribeExistingRequest()
        req.robotSessionID = robotSessionID

        let inner = client.subscribeExisting(req).makeAsyncIterator()

        return SessionIteratorImpl(inner: inner)
    }

    func getPastIterations(robotSessionID: Int64, firstIterationNo: Int64) async throws -> [IterationEntity] {
        var req = Ca_Joelathiessen_Kaly2_Proto_GetPastIterationsRequest()
        req.robotSessionID = robotSessionID
        req.firstIterationNo = firstIterationNo

        let inner = try await client.getPastIterations(req).iterations

        return try inner.map(IterationEntity.init)
    }

    func modifySessionSettings(robotSessionID: Int64, shouldRun: Bool) async throws {
        var req = Ca_Joelathiessen_Kaly2_Proto_ModifySessionSettingsRequest()
        req.robotSessionID = robotSessionID
        req.shouldRun = shouldRun
        let _ = try await client.modifySessionSettings(req)
    }

    func modifySlamSettings(robotSessionID: Int64, numParticles: Int32, sensorAngVar: Float, sensorDistVar: Float) async throws {
        var req = Ca_Joelathiessen_Kaly2_Proto_ModifySlamSettingsRequest()
        req.robotSessionID = robotSessionID
        req.numParticles = numParticles
        req.sensorAngVar = sensorAngVar
        req.sensorDistVar = sensorDistVar
        let _ = try await client.modifySlamSettings(req)
    }
}
