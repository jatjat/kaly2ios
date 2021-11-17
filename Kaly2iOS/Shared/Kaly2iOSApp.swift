//
//  Kaly2iOSApp.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import SwiftUI

@main
struct Kaly2iOSApp: App {
    let module = AppModule()
//    let comp = RootComponent()
    let root = RootComponent()
    
    init() {
        module.registerAll()
        root.setupComponents()
//        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            root.mainAppView
        }
    }
}

//func registerProviderFactories() {
//    UIDicom
//}

//class InfrastructureDependencyRoot: InfrastructureDependency {
//}


class RootComponent {
    private var uiDIComponent: UIDIComponent?
    
//    init() {
////        uiDIComponent = setupComponenets()
//    }
    
    func setupComponents() {
        let infrastructureDIComponent = InfrastructureDIComponent(parent: self)
        let domainDIComponent = infrastructureDIComponent.domainComponent
        let uiDIComponent = domainDIComponent.uiDIComponent
        self.uiDIComponent = uiDIComponent
    }
    
    var mainAppView: MainAppView {
        uiDIComponent!.mainAppView
    }
}

extension RootComponent: InfrastructureDependency {
}
