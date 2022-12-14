//
//  MasterView.swift
//  Sant Academy
//
//  Created by Lucas Santos on 14/12/22.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack(spacing: 8){
                    HStack{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                        }
                        Spacer()
                        
                    }
                    HStack{
                        VStack(spacing: 8){
                            ZStack{
                                Rectangle()
                                    .fill(Color.mint.opacity(0.8))
                                    .frame(width: 200 , height: 60)
                                    .cornerRadius(12)
                                Text("Código: 1234567")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(12)
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 200, height: 160)
                                    .clipShape(Circle())
                                Text("22")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                
                            }
                            Button {
                                
                            } label: {
                                
                                ZStack {
                                    Rectangle()
                                        .fill(Color.blue.opacity(0.8))
                                        .frame(width: 200, height: 60)
                                        .cornerRadius(12)
                                    
                                    Text("Sortear")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                        Rectangle()
                            .fill(Color.gray)
                            .cornerRadius(12)
                            .frame(width: 300, height: 300)
                            .padding()
                    }
                    Spacer()
                }.padding()
            }
            .background(ignoresSafeAreaEdges: .all)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
