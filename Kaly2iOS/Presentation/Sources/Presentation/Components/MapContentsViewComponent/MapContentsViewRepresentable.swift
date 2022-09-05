//
//  MapContentsViewRepresentable.swift
//  presentation
//
//  Created by Joel Thiessen on 2022-09-04.
//

import Foundation
import SwiftUI

struct MapContentsViewRepresentable: UIViewRepresentable {
    func makeUIView(context _: Context) -> MapContentsView {
        MapContentsView()
    }

    func updateUIView(_ uiView: MapContentsView, context _: Context) {
        // for now
        let color = UIColor.red.cgColor
        let points = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 10, y: 10),
            CGPoint(x: 30, y: 50),
            CGPoint(x: 70, y: 60),
            CGPoint(x: -10, y: 90),
        ]
        uiView.drawPaths(newPaths: [color: points])
    }
}
