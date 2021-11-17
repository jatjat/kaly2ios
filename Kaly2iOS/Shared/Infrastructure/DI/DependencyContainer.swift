//
//  DependencyContainer.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Foundation

final class DependencyContainer {
    private var dependencies = [String: AnyObject]()
    private static var shared = DependencyContainer()
    
    private var neededDependencies = Set<String>()

    static func register<T>(type: T.Type, _ dependency: Any) {
        shared.register(type: type, dependency)
    }
    
    static func willNeedResolved<T>(type: T.Type) {
        shared.needResolved(type: type)
    }
    
    static func checkRegistered() {
        shared.checkRegistered()
    }

    static func resolve<T>() -> T {
        shared.resolve()
    }

    private func register<T>(type: T.Type, _ dependency: Any) {
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }
    
    private func needResolved<T>(type: T.Type) {
        let key = String(describing: T.self)
        neededDependencies.insert(key)
    }
    
    private func checkRegistered() {
        // Check to make sure all registered dependencies will actually be resolvable.
        // Typically this should be done once, on app launch, immediately after
        // registering all needed dependencies.
        neededDependencies.forEach { key in
            let dependency = dependencies[key]
            precondition(dependency != nil, "No dependency was registered for key: \(key)")
        }
    }

    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T

        precondition(dependency != nil, "No dependency found for key: \(key)")

        return dependency!
    }
}
