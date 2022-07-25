//
//  IterationEntity+Extensions.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-24.
//

import Domain
import Foundation

extension IterationEntity {
    init(grpcResp: Ca_Joelathiessen_Kaly2_Proto_Iteration) throws {
        try self.init(bestPose: try PoseEntity(grpcResp: grpcResp.bestPose), odoPose: try PoseEntity(grpcResp: grpcResp.odoPose), truePose: try PoseEntity(grpcResp: grpcResp.truePose))
    }
}
