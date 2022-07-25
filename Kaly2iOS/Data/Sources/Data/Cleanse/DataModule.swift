//
//  DataModule.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Cleanse
import Domain
import Foundation
import GRPC

public struct DataModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder.bind(GRPCChannelFactoryImpl.self)
            .sharedInScope()
            .to(factory: GRPCChannelFactoryImpl.init)

        binder.bind(GRPCChannel.self)
            .to { (fact: GRPCChannelFactoryImpl) in
                fact.makeChannel()
            }

        binder.bind(Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient.self)
            .sharedInScope()
            .to {
                GRPCClientConfigurer.configureClient(client: Ca_Joelathiessen_Kaly2_Proto_MapServiceAsyncClient(channel: $0))
            }
        binder.bind(Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient.self)
            .sharedInScope()
            .to {
                GRPCClientConfigurer.configureClient(client: Ca_Joelathiessen_Kaly2_Proto_RobotServiceAsyncClient(channel: $0))
            }
        binder.bind(Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient.self)
            .sharedInScope()
            .to {
                GRPCClientConfigurer.configureClient(client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient(channel: $0))
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

        binder.bind(LastErrorTimeRepo.self)
            .to(factory: LastErrorTimeRepoImpl.init)
        binder.bind(OpenRobotSessionRepo.self)
            .to(factory: OpenRobotSessionRepoImpl.init)
    }
}
