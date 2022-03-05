//
//  AppModule.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Foundation
import Cleanse

import Data
import Domain

//class CoffeeMaker {
////    let mainAppView: MainAppView
////    
////    init(mainAppView: MainAppView) {
////    }
//}
//
//struct AppComponent: RootComponent {
//    typealias Root = Singleton
//
//    static func configureRoot(binder bind: ReceiptBinder<Singleton>) -> BindingReceipt<Singleton> {
//        return bind.to(factory: CoffeeMaker.init)
//    }
//    
//    static func configure(binder: Binder<Singleton>) {
//        binder.include(module: DataModule.self)
//        binder.include(module: DomainModule.self)
//    }
//}
//
//class AppModule {
//    let main = try! ComponentFactory.of(AppComponent.self).build(())
//}
