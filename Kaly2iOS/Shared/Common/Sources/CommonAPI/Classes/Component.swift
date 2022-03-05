//
//  Component.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Darwin
import Foundation

//public protocol Dependency {
//
//}

//open class Component<T> {
//    private let sharedLock = Lock()
//    private var sharedDeps = [String: Any]()
//    
//    public var dependency: T
//    
//    init(parent: T) {
//        self.dependency = parent
//    }
//    
//    public func shared<S>(_ factory: () -> S) -> S {
//        sharedLock.lock()
//        defer {
//            sharedLock.unlock()
//        }
//        
//        let key = "\(S.self)"
//        if let value = sharedDeps[key] as? S {
//            return value
//        }
//        
//        let value = factory()
//        sharedDeps[key] = value
//        return value
//    }
//}
