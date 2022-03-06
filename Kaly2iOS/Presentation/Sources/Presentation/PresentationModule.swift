//
//  PresentationModule.swift
//  Presentation
//
//  Created by Joel Thiessen on 2022-03-05.
//

import Cleanse
import Foundation
import PresentationAPI
import SwiftUI

public struct PresentationModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
//            .bind(AnyView.self)
//            .to(factory: ContView.init)
//            .bind(FlyoutView<MainAppViewImpl>.self)
//            .to(factory: FlyoutView.init)
//            .bind(CoolViewFactory.self)
//            .to(factory: CoolViewFactoryImpl.init)
            .bind(AnyView.self)
            .tagged(with: MainAppViewTag.self)
            .to(factory: {
                AnyView(MainAppViewImpl())
            })
    }
}

public struct MainAppViewTag : Tag {
    public typealias Element = AnyView
}

public struct CoolViewFactoryImpl: CoolViewFactory {
    public func getMainAppView() -> AnyView {
        AnyView(MainAppViewImpl())
    }
    

    @ViewBuilder
    func getMainAppview() -> some View {
        MainAppViewImpl()
    }
    
    public init () {
    }
}


//public struct CoolViewFactoryImpl {
//    
//    @ViewBuilder
//    func getMainAppview() -> some View {
//        return MainAppViewImpl()
//    }
//}
