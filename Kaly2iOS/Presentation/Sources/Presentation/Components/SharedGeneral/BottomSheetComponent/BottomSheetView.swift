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
    

    
    // Animation params for when finger is dragging bottom sheet
////     or bottom sheet top edge is tapped:
//    let touchResp = 0.15
//    let touchDampFrac = 0.86
//    let touchBlendDur = 0.25
    let dragOrTapAnim: Animation = .spring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25)
    
    // Animation for after finger is lifted from dragging
    // bottom sheet, or bottom sheet top edge is tapped:
//    let touchEndedResp = 0.3
//    let touchEndedDampFrac = 0.8
//    let touchEndedBlendDur = 0.25
    let tapOrTouchEndedAnim: Animation = .spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.25)

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
            withAnimation(tapOrTouchEndedAnim) {
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
            .offset(y: self.offset + self.dragAmount.height)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged { changeValue in
                    withAnimation(dragOrTapAnim) {
                        dragAmount = changeValue.translation
                    }
                }.onEnded { value in
                    withAnimation(tapOrTouchEndedAnim) {
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
