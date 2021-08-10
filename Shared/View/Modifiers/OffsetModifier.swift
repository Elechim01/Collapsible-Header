//
//  OffsetModifier.swift
//  OffsetModifier
//
//  Created by Michele Manniello on 10/08/21.
//

import SwiftUI
//Getting Scrollview offset...
struct OffsetModifier: ViewModifier{
    @Binding var offset : CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{ proxy -> Color in
//                    getting vale for coordinate space called scroll...
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return Color.clear
                }
                ,alignment: .top
            )
    }
}
