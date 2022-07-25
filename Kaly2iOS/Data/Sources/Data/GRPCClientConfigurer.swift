//
//  GRPCClientConfigurer.swift
//  data
//
//  Created by Joel Thiessen on 2022-07-23.
//

import Foundation
import GRPC
import NIOCore

class GRPCClientConfigurer {
    static func configureClient<T>(client: T) -> T where T: GRPCClient {
        var client = client
        client.defaultCallOptions = CallOptions(timeLimit: .deadline(NIODeadline.now() + .seconds(Constants.deadlineOffset)))
        return client
    }
}
