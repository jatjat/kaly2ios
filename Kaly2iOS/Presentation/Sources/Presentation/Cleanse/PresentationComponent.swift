//
//  PresentationComponent.swift
//  presentation
//
//  Created by Joel Thiessen on 2022-07-23.
//
//
// import Cleanse
// import Foundation
//
// struct Pres {}
//
// struct PresentationComponent: Cleanse.RootComponent {
//    typealias Root = PropertyInjector<MainAppViewImpl>
//
//    static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<MainAppViewImpl>>) -> BindingReceipt<PropertyInjector<MainAppViewImpl>> {
//        bind.propertyInjector(configuredWith: { bind in
//            bind.to(injector: MainAppViewImpl.injectProperties)
//        })
//    }
//
//    static func configure(binder: Binder<Singleton>) {
//        binder.include(module: PresentationModule.self)
//    }
// }
