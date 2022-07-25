//
//  MapView.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Domain
import Foundation
import SwiftUI

struct MapView: View {
//    @EnvironmentObject var viewModel: MapViewModel
    var body: some View {
//        VStack(alignment: .leading) {
//            EmptyView()
//            .green
//            Button(Text("tata"))
        Text("this will be map data")
            .onAppear {
                viewModel.onAppear()
            }

//        }
    }

    // There is conflicting information on whether this is a good approach:
    // For: https://swiftui-lab.com/random-lessons/#data-10
    // Against: https://stackoverflow.com/questions/68900888/how-do-i-properly-perform-dependency-injection-into-swiftui-stateobjects

    @StateObject var viewModel: MapViewModel
    init(viewModel: MapViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
