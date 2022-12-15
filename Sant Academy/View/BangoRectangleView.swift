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
            
        }.frame(width: 66, height: 50)
    }
}
