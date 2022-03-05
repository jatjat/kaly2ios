//
//  DomainComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import Combine
import CommonAPI
import DataAPI
//import NeedleFoundation
import Cleanse

public struct DomainModule: Module {
    public static func configure(binder: Binder<Unscoped>) {
//        binder.include(module: DataModule.self)
        
        
        binder
            .bind(ChangeRobotSettingsUseCase.self)
            .to(factory: ChangeRobotSettingsUseCaseImpl.init)
    }
}

//protocol DomainDependency: Dependency {
//    var mapClient: MapClient { get }
//    var robotClient: RobotClient { get }
//    var sessionClient: SessionClient { get }
//}
////
//class DomainComponentImpl: Component<DomainDependency> {
//
//    var changeRobotSettingsUseCase: ChangeRobotSettingsUseCase {
//        ChangeRobotSettingsUseCase(sessionClient: dependency.sessionClient)
//    }
//
////    var uiDIComponent: UIDIComponent {
////        UIDIComponent(parent: self)
////    }
//
//}
//
//extension DomainDIComponent: UIDependency {
//    var sessionService: SessionService {
//        SessionServiceImpl(mapClient: dependency.mapClient, robotClient: dependency.robotClient, sessionClient: dependency.sessionClient)
//    }
//}

//class Provider: Dependency {
//    func run() {
//        DomainDIComponent(parent: InfrastructureDIComponent())
//    }
//}


protocol SessionService {
    
}

public actor SessionServiceImpl: SessionService {
    let mapClient: MapClient
    
    let robotClient: RobotClient
    
    let sessionClient: SessionClient
    
//    @Published var iterations = [Iteration]()
//    @Published var bestPoses = [UIPose]()
//    @Published var odoPoses = [UIPose]()
//    @Published var truePoses = [UIPose]()
    
    //    let bestPoses = CurrentValueSubject<[Pose], Never>([Pose]())
    
//    var robotSessionID: Int64 = 0
    
    var iterations = [Iteration]()

    
//    var bestPose: UIPose {
//
//    }
//
//    var odoPoses: UIPose {
//
//    }
//
//    var truePose: UIPose {
//
//    }
//
//    var numParticles: Int32 {
//
//    }
//
//    var sensorDistVar: Float {
//
//    }
//
//    var sensorAngVar: Float {
//
//    }

    

//    var unknownFields = SwiftProtobuf.UnknownStorage()
    
    var itr: SessionIterator?
    
    func create(mapName: String, robotName: String, isReal: Bool) async throws {
        let mapId = try await mapClient.createMap(mapName: mapName)
        let robotId = try await robotClient.createRobot(robotName: robotName, isReal: isReal)
        itr = try await sessionClient.subscribeNew(robotID: robotId, mapID: mapId)
    }
    
//    var numParticles
    
    init(mapClient: MapClient, robotClient: RobotClient, sessionClient: SessionClient) {
        self.mapClient = mapClient
        self.robotClient = robotClient
        self.sessionClient = sessionClient
    }
}
