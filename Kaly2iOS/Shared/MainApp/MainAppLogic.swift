//
//  MainAppLogic.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Foundation
import GRPC

class MainAppLogic {
    
   // @Injected var mapClient: MapClient
        
    init() {
        
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
