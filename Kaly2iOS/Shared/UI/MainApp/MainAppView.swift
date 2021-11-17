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
//        Text("Hello, world!")
//            .padding()
//        BottomSheetView(isOpen: .constant(false), maxHeight: 600) {
//            Rectangle().fill(Color.red)
//        }.edgesIgnoringSafeArea(.all)
        ContentView()
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
//
//struct Item: Identifiable {
//    var id: ObjectIdentifier = ObjectIdentifier(AnyObject.self)
//    
//}
//
//struct ItemsView<Destination: View>: View {
//    let items: [Item]
//    let buildDestination: (Item) -> Destination
//    
//    let bob = Bob<AnyView>()
//
//    var body: some View {
//        NavigationView {
//            List(items) { item in
//                NavigationLink(destination: bob.buildDestination(item)) {
//                    Text(item.id.debugDescription)
//                }
//            }
//        }
//    }
//}
//
//class Bob<T: View> {
//    init() {
//        
//    }
//    
//    func buildDestination(_ item: Item) -> T {
//        return View()
//    }
//}
struct ContentView: View {
    @State private var bottomSheetShown = false

    var body: some View {
        GeometryReader { geometry in
            Color.green
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
                Color.blue
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
