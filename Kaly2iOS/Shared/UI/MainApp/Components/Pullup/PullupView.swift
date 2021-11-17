//
//  PullupView.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

//import Foundation


//
//  BottomSheetView.swift
//
//  Created by Majid Jabrayilov
//  Copyright © 2019 Majid Jabrayilov. All rights reserved.
//
import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.1 //0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    @GestureState private var translation: CGFloat = 0
    @State private var dragAmount = CGSize.zero

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            withAnimation(.spring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25)) {
                self.isOpen.toggle()
            }
        }
    }

    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
//            .offset(y: max(self.offset + self.translation, 0))
            .offset(y: self.offset + self.dragAmount.height)
//            .offset(y: max(self.offset + self.dragAmount.height, 0))
//            .animation(.interactiveSpring(response: 0.15, dampingFraction: 0.96, blendDuration: 10000))
//            .animation(.interactiveSpring(response: 0.15, dampingFraction: 0.96, blendDuration: 10000), value: translation)
            .highPriorityGesture(
//                DragGesture().updating(self.$translation) { value, state, _ in
                DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged { changeValue in
                    withAnimation(.spring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25)) {
                        dragAmount = changeValue.translation
                    }
          //      }
                //(self.$translation) { value, state, _ in
            //        state = value.translation.height
                }.onEnded { value in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.25)) {
                        dragAmount = .zero
                        let snapDistance = self.maxHeight * Constants.snapRatio
                        guard abs(value.translation.height) > snapDistance else {
                            return
                        }
                        self.isOpen = value.translation.height < 0
                    }

                }
            )
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(false), maxHeight: 200) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
