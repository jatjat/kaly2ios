//
//  MapService.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-29.
//

import DataAPI
import Foundation

class MapClientImpl: MapClient {
    let client: Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient

    init(client: Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient) {
        self.client = client
    }

    func createMap(mapName: String) async throws -> Int64 {
        var req = Ca_Joelathiessen_Kaly2_Proto_CreateMapRequest()
        req.mapName = mapName
        return try await client.createMap(req).mapID
    }
}
