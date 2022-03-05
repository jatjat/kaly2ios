//
//  InfrastructureComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import GRPC
#if os(macOS)
import CommonMacOSAPI
import DataMacOSAPI
#else
import CommonIOSAPI
import DataIOSAPI
#endif
//import NeedleFoundation

import Cleanse

public struct DataModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder.bind(GRPCChannelFactoryImpl.self)
            .sharedInScope()
            .to(factory: GRPCChannelFactoryImpl.init)
        
        binder.bind(GRPCChannel.self)
            .to { (fact: GRPCChannelFactoryImpl) in
                return fact.makeChannel()
            }
        
        binder.bind(Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient.self)
            .sharedInScope()
            .to {
                Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient(channel: $0)
            }
        binder.bind(Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient.self)
            .sharedInScope()
            .to {
                Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient(channel: $0)
            }
        binder.bind(Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient.self)
            .sharedInScope()
            .to {
                Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient(channel: $0)
            }
        
        binder.bind(MapClient.self)
            .sharedInScope()
            .to(factory: MapClientImpl.init)
        binder.bind(RobotClient.self)
            .sharedInScope()
            .to(factory: RobotClientImpl.init)
        binder.bind(SessionClient.self)
            .sharedInScope()
            .to(factory: SessionClientImpl.init)
    }
}


/*

public protocol DataDependency: Dependency {
    
}

public class DataComponentImpl: Component<DataDependency> {

    private var grpcChannelFactory: GRPCChannelFactory {
        shared {
            GRPCChannelFactoryImpl()
        }
    }
    
    private var grpcMapClient: Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient {
        shared {
            Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient(channel: grpcChannelFactory.channel)
        }
    }
    
    private var grpcRobotClient: Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient {
        shared {
            Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient(channel: grpcChannelFactory.channel)
        }
    }
    
    private var grpcSessionClient: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient {
        shared {
            Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient(channel: grpcChannelFactory.channel)
        }
    }
    
//    var domainComponent: DomainComponent {
//        shared {
//            DomainComponent.makeDomainComponent(parent: self)
////            DomainComponent(parent: self)
//        }
//    }
    
//    var domainComponent: DomainDIComponent {
//        shared {
//            DomainDIComponent(parent: self)
//        }
//    }
}

extension DataComponentImpl: DataProvider {
    public var mapClient: MapClient {
        shared {
            MapClientImpl(client: grpcMapClient)
        }
    }

    public var robotClient: RobotClient {
        shared {
            RobotClientImpl(client: grpcRobotClient)
        }
    }

    public var sessionClient: SessionClient {
        shared {
            SessionClientImpl(client: grpcSessionClient)
        }
    }
}

/*
// Satisfy dependencies for the domain module using the infrastructure module:
extension DataComponentImpl {//: DomainDependency {
    var mapClient: MapClient {
        shared {
            MapClientImpl(client: grpcMapClient)
        }
    }

    var robotClient: RobotClient {
        shared {
            RobotClientImpl(client: grpcRobotClient)
        }
    }

    var sessionClient: SessionClient {
        shared {
            SessionClientImpl(client: grpcSessionClient)
        }
    }
}
*/

*/
