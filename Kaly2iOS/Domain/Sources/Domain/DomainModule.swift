//
//  DomainModule.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import Combine
import CommonAPI
import DataAPI
import Cleanse

public struct DomainModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
            .bind(ChangeRobotSettingsUseCase.self)
            .to(factory: ChangeRobotSettingsUseCaseImpl.init)
    }
}

protocol SessionService {
    
}

public actor SessionServiceImpl: SessionService {
    let mapClient: MapClient
    
    let robotClient: RobotClient
    
    let sessionClient: SessionClient

    var iterations = [Iteration]()

    var itr: SessionIterator?
    
    func create(mapName: String, robotName: String, isReal: Bool) async throws {
        let mapId = try await mapClient.createMap(mapName: mapName)
        let robotId = try await robotClient.createRobot(robotName: robotName, isReal: isReal)
        itr = try await sessionClient.subscribeNew(robotID: robotId, mapID: mapId)
    }
        
    init(mapClient: MapClient, robotClient: RobotClient, sessionClient: SessionClient) {
        self.mapClient = mapClient
        self.robotClient = robotClient
        self.sessionClient = sessionClient
    }
}
