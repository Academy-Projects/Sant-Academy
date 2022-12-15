//
//  HomeView.swift
//  Sant Academy
//
//  Created by Lucas Santos on 14/12/22.
//
import SwiftUI

struct HomeView: View {
    let vm = MasterView.ViewModel()
    var body: some View {
        ZStack {
            VStack(spacing: 12){
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 33, height: 27)
                            .foregroundColor(.black)
                    }

                }.padding(.bottom,28)
                
                VStack(alignment: .center, spacing: 0){
                    Text("Natal")
                        .font(.largeTitle)
                    Text("Academy")
                        .font(.largeTitle)
                }
                
                Rectangle()
                    .fill(Color.mint)
                    .frame(width: 250, height:330)
                    .cornerRadius(12)
                    .padding(.bottom,41)
                NavigationLink(destination: MasterView(viewModel: vm )) {
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 279, height: 61)
                            .cornerRadius(30)
                        Text("Criar Sala")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                }
                NavigationLink(destination: ContentView()) {
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 279, height: 61)
                            .cornerRadius(30)
                        Text("Entrar")
                            .font(.title2)
                            .foregroundColor(Color.white)
                    }
                    
                }
                
                
                Spacer()
                
            }.padding(18)
        }
        .background(ignoresSafeAreaEdges: .all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
