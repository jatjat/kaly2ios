//
//  PresentationModule.swift
//  Presentation
//
//  Created by Joel Thiessen on 2022-03-05.
//

import Cleanse
import Foundation
import SwiftUI

// @MainActor
public struct PresentationModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
            .bind(AnyView.self)
            .tagged(with: MainAppViewTag.self)
            .to(factory: { (contentView: ContentView, viewModel: MainAppScreenViewModel) in
                let vmi = MainAppScreenViewImpl(contentView: contentView, viewModel: viewModel)
                return AnyView(vmi)
            })

        binder
            .bind(MapViewModel.self)
            .to(factory: MapViewModel.init)
        binder
            .bind(MainAppScreenViewModel.self)
            .to(factory: MainAppScreenViewModel.init)

        binder
            .bind(ContentView.self)
            .to(factory: ContentView.init)
        binder.bind(MapContentsViewRepresentable.self)
            .to(factory: MapContentsViewRepresentable.init)
        binder.bind(MapView.self)
            .to(factory: MapView.init)
    }
}

public struct MainAppViewTag: Tag {
    public typealias Element = AnyView
}
