//
//  DIComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import NIOConcurrencyHelpers

protocol Dependency {
    
}

class Component<T> {
    private let sharedLock = Lock()
    private var sharedDeps = [String: Any]()
    
    var dependency: T
    
    init(parent: T) {
        self.dependency = parent
    }
    
    func shared<S>(_ factory: () -> S) -> S {
        sharedLock.lock()
        defer {
            sharedLock.unlock()
        }
        
        let key = "\(S.self)"
        if let value = sharedDeps[key] as? S {
            return value
        }
        
        let value = factory()
        sharedDeps[key] = value
        return value
    }
}

//class LoggedInComponent: Component<LoggedInDependency> {
//    var gameComponent: GameComponent {
//        return GameComponent(parent: self)
//    }
//}
