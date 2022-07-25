//
//  SubscribeResponseEntity+Extensions.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-24.
//

import Domain
import Foundation

extension SubscribeResponseEntity {
    init(grpcResp: Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) throws {
        try self.init(robotSessionID: grpcResp.robotSessionID, iteration: IterationEntity(grpcResp: grpcResp.iteration))
    }
}
