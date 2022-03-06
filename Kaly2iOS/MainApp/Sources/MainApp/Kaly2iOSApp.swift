//
//  Kaly2iOSApp.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Cleanse
import SwiftUI
import Domain
import Data
import PresentationAPI
import Presentation

@main
class Kaly2iOSApp: App {
    var mainAppView: AnyView!
    
    required init() {
        let propertyInjector = try! ComponentFactory.of(Kaly2iOSApp.Component.self).build(())
        propertyInjector.injectProperties(into: self)
    }
    
    var body: some Scene {
        WindowGroup {
            mainAppView
        }
    }
    
    func injectProperties(provider: TaggedProvider<MainAppViewTag>) {
        self.mainAppView = provider.get()
    }
}

extension Kaly2iOSApp {
    struct Component : Cleanse.RootComponent {
        typealias Root = PropertyInjector<Kaly2iOSApp>
        
        static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<Kaly2iOSApp>>) -> BindingReceipt<PropertyInjector<Kaly2iOSApp>> {
            return bind.propertyInjector(configuredWith: { bind in
                bind.to(injector: Kaly2iOSApp.injectProperties)
            })
        }
        
        static func configure(binder: Binder<Singleton>) {
            binder.include(module: PresentationModule.self)
            binder.include(module: DomainModule.self)
            binder.include(module: DataModule.self)
        }
    }
}
