//
//  ContentView.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import SwiftUI
// import Cleanse

struct MainAppViewImpl: MainAppView {
    // SwiftUI compatibility, see below for an alternative approach
//    var mapViewModel: MapViewModel

    let contentView: ContentView
    var body: some View {
//        ContentView()
        contentView
    }

    public init(contentView: ContentView) {
//        self.mapViewModel = mapViewModel
        self.contentView = contentView

        // There is conflicting information on whether this is a good approach:
        // For: https://swiftui-lab.com/random-lessons/#data-10
        // Against: https://stackoverflow.com/questions/68900888/how-do-i-properly-perform-dependency-injection-into-swiftui-stateobjects
//        self._viewModel = StateObject(wrappedValue: viewModel)
    }
//    @StateObject var viewModel: MainAppViewModel
}

struct ContentView: View {
    @State private var bottomSheetShown = false
//    let mapComponent: MapComponent
//    let insideBottomSheetComponent: InsideBottomSheetComponent
    let mapView: MapView
    var body: some View {
        mapView
        GeometryReader { geometry in
            Color.green
//            mapComponent.mapView
//            bottomSheetComponent.bottomSheetView
//            MapView()

            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
//                insideBottomSheetComponent.insideBottomSheetView
                Color.blue
            }
        }.edgesIgnoringSafeArea(.all)
    }

    init(mapView: MapView) {
        self.mapView = mapView
    }
}

// extension MainAppViewImpl {
//    func injectProperties(mapViewModel: MapViewModel) {
////        func injectProperties(viewModel: MainAppViewModel, mapViewModel: MapViewModel) {
////        self.viewModel = viewModel
//        self.mapViewModel = mapViewModel
//    }
// }

// struct MainAppView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainAppViewImpl(mapViewModel: Map)
//    }
// }
