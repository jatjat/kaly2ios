//
//  ContentView.swift
//  Shared
//
//  Created by Joel Thiessen on 2021-09-28.
//

import SwiftUI

struct MainAppView: View {
    @StateObject var viewModel = MainAppViewModel()
    var body: some View {
        ContentView()
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}

struct ContentView: View {
    @State private var bottomSheetShown = false
//    let mapComponent: MapComponent
//    let insideBottomSheetComponent: InsideBottomSheetComponent
    var body: some View {
        GeometryReader { geometry in
            Color.green
//            mapComponent.mapView
//            bottomSheetComponent.bottomSheetView
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
//                insideBottomSheetComponent.insideBottomSheetView
                Color.blue
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


