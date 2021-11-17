//
//  MainAppLogic.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Foundation
import GRPC

class MainAppLogic {
    
    @Injected var mapClient: MapClient
        
    init() {
        
    }
}


protocol GRPCChannelFactory {
    var channel: GRPCChannel { get }
}

class GRPCChannelFactoryImpl: GRPCChannelFactory {
    @Injected var config: AppConfig
    
    private var innerChannel: GRPCChannel?
    
    var channel: GRPCChannel {
        precondition(innerChannel != nil, "Channel must be made before it's accessed")

        return innerChannel!
    }
    
    func setup() {
        self.innerChannel = makeChannel()
    }
    
    func makeChannel() -> GRPCChannel {
        let host = config.host
        let port = config.port
        
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        defer {
          try? group.syncShutdownGracefully()
        }
        
        let channel = ClientConnection.insecure(group: group)
          .connect(host: host, port: port)
        return channel
    }
}

enum Kaly2iOSErrors: Error {
    case nilValueError
}

struct AppConfig: Codable {
    var host: String
    var port: Int
    
    private init(host: String, port: Int) {
        self.host = host
        self.port = port
    }
    
    static func fromAppPlist() -> AppConfig {
        return AppConfig(host: "", port: 1)
    }
}
