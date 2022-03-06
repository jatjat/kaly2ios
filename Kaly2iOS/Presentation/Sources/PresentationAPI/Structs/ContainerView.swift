//
//  ContainerView.swift
//  PresentationAPI
//
//  Created by Joel Thiessen on 2022-03-05.
//

import Foundation
import SwiftUI

public struct ContainerView<Content: View>: View {
    @ViewBuilder var content: Content
    
    public var body: some View {
        content
    }
}

public protocol ContViewProto {
    func getAnyView() -> AnyView
}

public struct ContView: ContViewProto {
    public func getAnyView() -> AnyView {
        return AnyView(Text(""))
    }
    
    public init() {
    }
}

//public struct EqView<T> : View, Equa where T : View {
//    
//}

public struct FlyoutView<HeaderView> : View where HeaderView : View {

    let headerView: HeaderView

    public var body: some View {
        VStack {
            headerView
            Spacer()
        }
    }
    
    public init(headerView: HeaderView) {
        self.headerView = headerView
    }
}

public protocol CoolViewFactory {
//    func getMainAppView<T>() -> T where T : View
    func getMainAppView() -> AnyView
}
