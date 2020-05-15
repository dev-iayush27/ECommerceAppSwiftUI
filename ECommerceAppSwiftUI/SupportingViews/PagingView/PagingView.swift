//
//  ImageSlderView.swift
//  ECommerceAppSwiftUI
//
//  Created by Ayush Gupta on 10/12/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import SwiftUI

struct PagingView<Content>: View where Content: View {
    
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    
    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        self.content()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture().onChanged { value in
                        self.dragging = true
                        self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                        let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                        self.index = self.clampedIndex(from: predictedIndex)
                        withAnimation(.easeOut) {
                            self.dragging = false
                        }
                    }
                )
            }
            .clipped()
            
//            VStack {
//                // StrokeText(text: "40-60% Off On Winter Sale", width: 0.5, color: .red)
//                Text("40-60% Off On Winter Sale")
//                    .foregroundColor(.white)
//                    .font(.custom(Constants.AppFont.extraBoldFont, size: 18))
//                    .padding(.top, 5)
//                Text("Terms & conditions apply*")
//                    .padding(.top, -3)
//                    .foregroundColor(.white)
//                    .font(.custom(Constants.AppFont.semiBoldFont, size: 10))
//                    .padding(.bottom, 8)
//            }
//            .padding(.bottom, 15)
//            .frame(width: UIScreen.main.bounds.width)
//            .background(Color.black.opacity(0.35))
            
            PageControl(index: $index, maxIndex: maxIndex)
        }
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
}

struct PageControl: View {
    
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(index == self.index ? Constants.AppColor.secondaryRed : Color.white)
                    .frame(width: 10, height: 3)
            }
        }
        .padding(10)
    }
}
