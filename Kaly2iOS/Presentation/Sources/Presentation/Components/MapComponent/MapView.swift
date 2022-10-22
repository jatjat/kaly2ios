//
//  MapView.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Combine
import Domain
import Foundation
import SwiftUI

struct MapView: View {
    @StateObject var viewModel: MapViewModel

    var representatble: MapContentsViewRepresentable
    var body: some View {
        HStack(alignment: .center) {
            Text("there will be map data here")
                .font(.body)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
                .onAppear {
                    viewModel.onAppear()
                }
            self.representatble
        }.onAppear {
            onAppear()
        }
    }

    func onAppear() {
        Task {
            Publishers.CombineLatest3(viewModel.$bestPoses, viewModel.$odoPoses, viewModel.$truePoses).map { combined in
                [
                    // Hardcode colors on the view:
                    UIColor.blue.cgColor: combined.0.map { $0.asCGPoint() },
                    UIColor.green.cgColor: combined.1.map { $0.asCGPoint() },
                    UIColor.red.cgColor: combined.2.map { $0.asCGPoint() },
                ]
            }.sink(receiveValue: representatble.update)
        }
    }

    // There is conflicting information on whether this is a good approach:
    // For: https://swiftui-lab.com/random-lessons/#data-10
    // Against: https://stackoverflow.com/questions/68900888/how-do-i-properly-perform-dependency-injection-into-swiftui-stateobjects

    nonisolated init(viewModel: MapViewModel, representable: MapContentsViewRepresentable) {
        _viewModel = StateObject(wrappedValue: viewModel)
        representatble = representable
    }
}

extension PoseEntity {
    func asCGPoint() -> CGPoint {
        CGPoint(x: Double(x), y: Double(y))
    }
}
