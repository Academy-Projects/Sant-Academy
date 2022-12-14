//
//  HomeView.swift
//  Sant Academy
//
//  Created by Lucas Santos on 14/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 12){
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "camera")
                    }

                }
                
                Rectangle()
                    .fill(Color.mint)
                    .frame(width: 300, height:300)
                    .cornerRadius(12)
                Spacer()
                
                NavigationLink(destination: MasterView()) {
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 300, height: 60)
                            .cornerRadius(9)
                        Text("Criar Sala")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                }
                NavigationLink(destination: ContentView()) {
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 300, height: 60)
                            .cornerRadius(9)
                        Text("Entrar")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                }
                
                
                Spacer()
                
            }.padding()
        }
        .background(ignoresSafeAreaEdges: .all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
