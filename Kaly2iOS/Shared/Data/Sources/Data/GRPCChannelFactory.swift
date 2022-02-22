//
//  GRPCChannelFactory.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2022-02-19.
//

import Foundation
import GRPC

protocol GRPCChannelFactory {
    var channel: GRPCChannel { get }
}

class GRPCChannelFactoryImpl: GRPCChannelFactory {
//    @Injected var config: AppConfig
    
    private var innerChannel: GRPCChannel?
    
    var channel: GRPCChannel {
        precondition(innerChannel != nil, "Channel must be made before it's accessed")

        return innerChannel!
    }
    
    func setup() {
        self.innerChannel = makeChannel()
    }
    
    func makeChannel() -> GRPCChannel {
        let host = ""// config.host
        let port = 9000 // config.port
        
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        defer {
          try? group.syncShutdownGracefully()
        }
        
        let channel = ClientConnection.insecure(group: group)
          .connect(host: host, port: port)
        return channel
    }
}
