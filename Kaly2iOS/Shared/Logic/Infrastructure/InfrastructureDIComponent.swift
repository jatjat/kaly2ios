//
//  InfrastructureComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import GRPC

protocol InfrastructureDependency: Dependency {
    
}

class InfrastructureDIComponent: Component<Dependency> {

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
    
    var domainComponent: DomainDIComponent {
        shared {
            DomainDIComponent(parent: self)
        }
    }
}

// Satisfy dependencies for the domain module using the infrastructure module:
extension InfrastructureDIComponent: DomainDependency {
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
