//
//  BangoCardView.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import SwiftUI

struct BangoCardView: View {
    @ObservedObject var viewModel = BangoCardViewModel()
    
    let rows = [
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30)
    ]
    
    let bingo = Array("bingo")
    
    var body: some View {
        ZStack{
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            
            HStack(){
                VStack{
                    Circle()
                        .strokeBorder(Color("bangoGreen"), lineWidth: 10)
                        .frame(width: 122, height: 122)
                        .background(){
                            Circle().fill(Color("bangoRed"))
                            
                            Text(String(viewModel.recsRemaining))
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    
                    Button {
                        
                    } label: {
                        BangoButtonView()
                            .padding(.top, 20)
                    }

                }
                .padding(.trailing, 70)
                
                LazyHGrid(rows: rows, spacing: 4) {
                    ForEach(bingo, id: \.self){ c in
                        BangoRectangleView(
                            rectangleColor: "bangoGreen",
                            text: String(c).uppercased(),
                            font: .title,
                            fontWeight: .bold,
                            color: .white
                        )
                        
                        let sortedNumbers = viewModel.card[String(c)]!
                        
                        ForEach(0..<5){ i in
                            let isNumber: Int? = Int(sortedNumbers[i])
                            let isSelected = viewModel.selectedRecs[String(c)]![i]
                            
                            Button {
                                viewModel.updateRecs(String(c), i)
                            } label: {
                                BangoRectangleView(
                                    rectangleColor: isSelected ? "bangoRed" : "bangoNumbers",
                                    text: String(sortedNumbers[i]),
                                    font: isNumber == nil ? .caption2 : .title,
                                    fontWeight: .regular,
                                    color: isSelected ? .white : .black
                                )
                            }

                        }
                    }
                }
            }
            .padding(.top, 14)
        }
        .onAppear{
            print(self.viewModel.card)
            
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscape
        }
    }
}

struct BangoCardView_Previews: PreviewProvider {
    static var previews: some View {
        BangoCardView()
    }
}
