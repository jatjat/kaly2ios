//
//  SessionClient.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import Foundation

protocol SessionClient {
    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator
}
