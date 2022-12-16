//
//  BangoView.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import SwiftUI

struct BangoView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = BangoViewModel()
    @State var confeteBool = false
    
    let rows = [
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible(), spacing: -30)
    ]
    
    let bango = Array("bango")
    
    var body: some View {
        GeometryReader{ geometry in
            let widthScale = geometry.size.width / 844
            let heightScale = geometry.size.height / 390
            
            ZStack{
                Color("background").edgesIgnoringSafeArea(.all)
                
                HStack(){
                    ZStack{
                        if confeteBool == true {
                            congrats()
                        }
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(Color.greenButton)
                                
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width*0.0426, height: UIScreen.main.bounds.height*0.09)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.top, 20)
                        
                        VStack{
                            Text("Bolas restantes:")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Circle()
                                .strokeBorder(Color("GreenButton"), lineWidth: 10)
                                .frame(width: 122 * widthScale, height: 122 * heightScale)
                                .background(){
                                    Circle().fill(Color("RedButton"))
                                    
                                    Text(String(viewModel.recsRemaining))
                                        .font(.system(size: 45 * heightScale))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            
                            Button {
                                confeteBool = true
                            } label: {
                                BangoButtonView(
                                    widthScale: widthScale,
                                    heightScale: heightScale
                                )
                                    .padding(.top, 20)
                            }

                        }
                    }
                    
                    LazyHGrid(rows: rows, spacing: 4) {
                        ForEach(bango, id: \.self){ bangoLetter in
                            BangoRectangleView(
                                rectangleColor: "GreenButton",
                                text: String(bangoLetter).uppercased(),
                                font: .title,
                                fontWeight: .bold,
                                color: .white,
                                widthScale: widthScale,
                                heightScale: heightScale
                            )
                            
                            let sortedNumbers = viewModel.card[String(bangoLetter)]!
                            
                            ForEach(0..<5){ i in
                                let isNumber = Int(sortedNumbers[i]) != nil
                                let isSelected = viewModel.selectedRecs[String(bangoLetter)]![i]
                                
                                Button {
                                    if(isNumber){
                                        viewModel.updateRecs(String(bangoLetter), i)
                                    }
                                } label: {
                                    BangoRectangleView(
                                        rectangleColor: isSelected ? "RedButton" : "CircleBackground",
                                        text: String(sortedNumbers[i]),
                                        font: isNumber ? .title : .caption2,
                                        fontWeight: .regular,
                                        color: isSelected ? .white : .black,
                                        widthScale: widthScale,
                                        heightScale: heightScale
                                    )
                                }

                            }
                        }
                    }.padding(.trailing, 50)
                }
                .padding(.top, 14)
                
                Image("lights")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .ignoresSafeArea()
            }
            .background(Color("Background"))
        }
        .navigationBarHidden(true)
        .onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscape
        }
        .onDisappear(){
            viewModel.resetBango()
        }
    }
}

struct BangoView_Previews: PreviewProvider {
    static var previews: some View {
        BangoView()
    }
}
