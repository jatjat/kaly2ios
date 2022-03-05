//
//  UIDIComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Cleanse
import Foundation
import SwiftUI

public struct PresentationModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
            .bind(MainAppView.self)
            .to(factory: MainAppView.init)
    }
}
