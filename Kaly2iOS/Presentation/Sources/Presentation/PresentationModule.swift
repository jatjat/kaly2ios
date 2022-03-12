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
