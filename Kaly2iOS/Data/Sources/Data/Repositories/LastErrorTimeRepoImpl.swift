//
//  LastErrorTimeRepoImpl.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-23.
//

import Domain
import Foundation

class LastErrorTimeRepoImpl: LastErrorTimeRepo {
    var date: Date?
    func get() -> Date? {
        date
    }

    func save(_ newDate: Date?) {
        date = newDate
    }
}
