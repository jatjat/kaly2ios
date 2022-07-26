//
//  ContentView.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import SwiftUI
// import Cleanse

struct MainAppViewImpl: MainAppView {
    @StateObject var viewModel: MainAppViewModel
    // SwiftUI compatibility, see above/below for an alternative approach
//    var mapViewModel: MapViewModel

    let contentView: ContentView
    var body: some View {
//        ContentView()
        contentView
    }

    public init(contentView: ContentView, viewModel: MainAppViewModel) {
//        self.mapViewModel = mapViewModel
        self.contentView = contentView

        // There is conflicting information on whether this is a good approach:
        // For: https://swiftui-lab.com/random-lessons/#data-10
        // Against: https://stackoverflow.com/questions/68900888/how-do-i-properly-perform-dependency-injection-into-swiftui-stateobjects
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct ContentView: View {
    @State private var bottomSheetShown = false
    let mapView: MapView
    var body: some View {
        GeometryReader { geometry in
            Color.green
            mapView
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
//              insideBottomSheetView
                Color.blue
            }
        }.edgesIgnoringSafeArea(.all)
    }

    init(mapView: MapView) {
        self.mapView = mapView
    }
}

#if PREVIEW
    import DomainMocks
    struct MainAppView_Previews: PreviewProvider {
        let seeMapUseCaseMock = SeeMapUseCaseMock()
        static var previews: some View {
            MainAppViewImpl(contentView: ContentView(mapView: MapView(viewModel: MapViewModel(updateMapUseCase: seeMapUseCaseMock))))
        }

        init() {
            seeMapUseCaseMock.executeHandler = {
                let pose = PoseEntity(x: 0, y: 0, heading: 0)
                UpdateMapUseCaseResult(bestPoses: [pose], odoPoses: [pose], truePoses: [pose])
            }
        }
    }
#endif
