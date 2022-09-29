//
//  ContentView.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import SwiftUI
// import Cleanse

struct MainAppScreenViewImpl: MainAppScreenView {
    @StateObject var viewModel: MainAppScreenViewModel
    // SwiftUI compatibility, see above/below for an alternative approach
//    var mapViewModel: MapViewModel

    let contentView: ContentView
    var body: some View {
//        ContentView()
        contentView
    }

    public init(contentView: ContentView, viewModel: MainAppScreenViewModel) {
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

// #if PREVIEW
import Domain
import DomainMocks
struct MainAppView_Previews: PreviewProvider {
    static let seeMapUseCaseMock = SeeMapUseCaseImpl(robotClient: RobotClientMock(), mapClient: MapClientMock(), sessionClient: SessionClientMock(), openRobotSessionRepo: OpenRobotSessionRepoMock(), lastErrorTimeRepo: LastErrorTimeRepoMock())

//        static let seeMapUseCaseMock = SeeMapUseCaseImpl(robotClient: RobotClientMock(), mapClient: MapClientMock(), sessionClient: SessionClientMock(), openRobotSessionRepo: OpenRobotSessionRepoMock(), lastErrorTimeRepo: LastErrorTimeRepoMock())
//        seeMapUseCaseMock.

//        let contentView =

    static var previews: some View {
        MainAppScreenViewImpl(contentView: ContentView(mapView: MapView(viewModel: MapViewModel(updateMapUseCase: seeMapUseCaseMock))), viewModel: MainAppScreenViewModel())

//            MainAppScreenViewImpl(contentView: ContentView(mapView: MapView(viewModel: MapViewModel(updateMapUseCase: seeMapUseCaseMock))))
    }

    init() async {
//            try? await MainAppView_Previews.seeMapUseCaseMock.execute()
//            seeMapUseCaseMock.executeHandler = {
//                let pose = PoseEntity(x: 0, y: 0, heading: 0)
//                return UpdateMapUseCaseResult(bestPoses: [pose], odoPoses: [pose], truePoses: [pose])
//            }
    }
}

// #endif
//
// @main
// class Kaly2iOSAp2p: App {
//    var body: some Scene {
//        WindowGroup {
//        }
//    }
//
//    required init() {
//    }
// }
