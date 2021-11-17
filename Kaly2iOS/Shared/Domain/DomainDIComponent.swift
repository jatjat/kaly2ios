//
//  DomainComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation

protocol DomainDependency: Dependency {
    var mapClient: MapClient { get }
    var robotClient: RobotClient { get }
    var sessionClient: SessionClient { get }
}

class DomainDIComponent: Component<DomainDependency> {
    var uiDIComponent: UIDIComponent {
        UIDIComponent(parent: self)
    }
}

extension DomainDIComponent: UIDependency {
    var sessionService: SessionService {
        SessionServiceImpl(mapClient: dependency.mapClient, robotClient: dependency.robotClient, sessionClient: dependency.sessionClient)
    }
}

//class Provider: Dependency {
//    func run() {
//        DomainDIComponent(parent: InfrastructureDIComponent())
//    }
//}


protocol SessionService {
    
}
public class SessionServiceImpl: SessionService {
    init(mapClient: MapClient, robotClient: RobotClient, sessionClient: SessionClient) {
        
    }
}

