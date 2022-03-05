//
//  MapClient.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Foundation

public protocol MapClient {
    func createMap(mapName: String) async throws -> Int64
}
