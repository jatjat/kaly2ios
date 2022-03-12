//
//  ContainerView.swift
//  PresentationAPI
//
//  Created by Joel Thiessen on 2022-03-05.
//

import Foundation
import SwiftUI

public protocol DoMore {
    func doMore()
}

public struct ContainerView<Content: View>: View, DoMore {
    public func doMore() {
        (content as! DoMore).doMore()
    }
    
    @ViewBuilder var content: Content
    
    public var body: some View {
        content
    }
    
    public init(content: Content) {
        self.content = content
    }
}
