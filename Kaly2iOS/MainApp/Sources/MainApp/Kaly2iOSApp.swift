//
//  Kaly2iOSApp.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Cleanse
import Data
import Domain
import Presentation
import SwiftUI

class Container {
    var mainAppView: AnyView!

    func injectProperties(provider: TaggedProvider<MainAppViewTag>) {
        mainAppView = provider.get()
    }
}

@main
struct Kaly2iOSApp: App {
    let container = Container()

    init() {
        let propertyInjector = try! ComponentFactory.of(Container.Component.self).build(())
        propertyInjector.injectProperties(into: container)
    }

    var body: some Scene {
        WindowGroup {
            container.mainAppView
        }
    }
}

struct Kaly2iOSApp_Previews: PreviewProvider {
    static var previews: some View {
        Button("asd") {}
    }
}

extension Container {
    struct Component: Cleanse.RootComponent {
        typealias Root = PropertyInjector<Container>

        static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<Container>>)
            -> BindingReceipt<PropertyInjector<Container>>
        {
            bind.propertyInjector(configuredWith: { bind in
                bind.to(injector: Container.injectProperties)
            })
        }

        static func configure(binder: Binder<Singleton>) {
            binder.include(module: PresentationModule.self)
            binder.include(module: DomainModule.self)
            binder.include(module: DataModule.self)
        }
    }
}
