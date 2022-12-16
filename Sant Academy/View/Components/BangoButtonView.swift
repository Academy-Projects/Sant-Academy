//
//  BangoButtonView.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import SwiftUI

struct BangoButtonView: View {
    let widthScale: CGFloat
    let heightScale: CGFloat
    
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("YellowButton"))
            
            Text("Bingo")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }.frame(width: 228 * self.widthScale, height: 50 * self.heightScale)
    }
}
