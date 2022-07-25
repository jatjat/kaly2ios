//
//  PresentationModule.swift
//  Presentation
//
//  Created by Joel Thiessen on 2022-03-05.
//

import Cleanse
import Foundation
import SwiftUI

public struct PresentationModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
//            .bind(MainAppViewImpl.self)
            .bind(AnyView.self)
            .tagged(with: MainAppViewTag.self)
//            .to(factory: MainAppViewImpl.init)
//            .to(factory: { (vmi: MainAppViewImpl) in
//                AnyView(vmi)
//            })
//            .to(factory: { (mapViewModel: MapViewModel, mainAppViewModel: MainAppViewModel) in
//                let vmi = MainAppViewImpl(viewModel: mainAppViewModel, mapViewModel: mapViewModel)
//                return AnyView(vmi)
//            })
            .to(factory: { (contentView: ContentView) in
                let vmi = MainAppViewImpl(contentView: contentView)
                return AnyView(vmi)
            })
//            .to(factory: MainAppViewImpl.init)

        binder
            .bind(MapViewModel.self).to(factory: MapViewModel.init)
        binder.bind(MainAppViewModel.self).to(factory: MainAppViewModel.init)

        binder.bind(ContentView.self).to(factory: ContentView.init)
        binder.bind(MapView.self).to(factory: MapView.init)
    }
}

public struct MainAppViewTag: Tag {
//    public typealias Element = MainAppView
    public typealias Element = AnyView
}
