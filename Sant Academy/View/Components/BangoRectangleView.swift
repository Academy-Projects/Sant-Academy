//
//  BangoRectangleView.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import SwiftUI

struct BangoRectangleView: View {
    let rectangleColor: String
    let text: String
    let font: Font
    let fontWeight: Font.Weight
    let color: Color
    let widthScale: CGFloat
    let heightScale: CGFloat
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(self.rectangleColor))
            
            Text(self.text)
                .font(self.font)
                .fontWeight(self.fontWeight)
                .foregroundColor(color)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            
        }.frame(width: 66 * self.widthScale, height: 50 * self.heightScale)
    }
}
