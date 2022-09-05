//
//  MapView.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Domain
import Foundation
import SwiftUI

@MainActor
struct MapView: View {
    @StateObject var viewModel: MapViewModel

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
            MapContentsViewRepresentable()
        }
    }

    // There is conflicting information on whether this is a good approach:
    // For: https://swiftui-lab.com/random-lessons/#data-10
    // Against: https://stackoverflow.com/questions/68900888/how-do-i-properly-perform-dependency-injection-into-swiftui-stateobjects

    nonisolated init(viewModel: MapViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
