//
//  UIDIComponent.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Foundation
import SwiftUI

protocol UIDependency: Dependency {
    var sessionService: SessionService { get }
}

class UIDIComponent: Component<UIDependency> {
    var mainAppView: MainAppView {
        MainAppView(viewModel: self.mainAppViewModel)
    }
    
    var mainAppViewModel: MainAppViewModel {
        MainAppViewModel()
    }
    
//    var mapComponent: MapComponent {
//
//    }
//
//    var pullupComponent: PullupComponent {
//
//    }
}
//
