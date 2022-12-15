//
//  BangoButtonView.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import SwiftUI

struct BangoButtonView: View {
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("bangoButton"))
            
            Text("Bingo")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }.frame(width: 228, height: 50)
    }
}

struct BangoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BangoButtonView()
    }
}
