//
//  PoseEntity+Extensions.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-24.
//

import Domain
import Foundation

extension PoseEntity {
    init(grpcResp: Ca_Joelathiessen_Kaly2_Proto_Pose) throws {
        self.init(x: grpcResp.x, y: grpcResp.y, heading: grpcResp.heading)
    }
}
