//
//  Constants.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-23.
//

import Foundation

struct Constants {
    // Each GRPC call should take less than the current time plus this many seconds:
    static let deadlineOffset: Int64 = 10
}
