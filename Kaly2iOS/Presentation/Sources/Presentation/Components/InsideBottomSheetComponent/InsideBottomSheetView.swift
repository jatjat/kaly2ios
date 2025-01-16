//
//  InsideBottomSheetView.swift
//  Kaly2iOS (iOS)
//
//  Created by Joel Thiessen on 2021-11-19.
//

import Foundation
import SwiftUI

struct InsideBottomSheetView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Color.blue.scaledToFill()
            EmptyView()
        }
    }
}

struct InsideBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        InsideBottomSheetView()
        Rectangle().fill(Color.green)
    }

    init() async {}
}
