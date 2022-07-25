//
//  OpenRobotSessionRepoImpl.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-23.
//

import Domain
import Foundation

class OpenRobotSessionRepoImpl: OpenRobotSessionRepo {
    var session: OpenRobotSessionEntity?
    func get() -> OpenRobotSessionEntity? {
        session
    }

    func save(_ sesIn: OpenRobotSessionEntity?) {
        session = sesIn
    }
}
