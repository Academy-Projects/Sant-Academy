//
//  HomeView.swift
//  Sant Academy
//
//  Created by Lucas Santos on 14/12/22.
//
import SwiftUI

struct HomeView: View {
    
    let vm = MasterView.ViewModel()
    @State private var capturedImage: UIImage? = nil
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView(.vertical){
                ZStack {
                    VStack(spacing: 12){
                        HStack{
                            Spacer()
                             NavigationLink{
                                 ContentView()
                            } label: {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width*0.0846, height: UIScreen.main.bounds.height*0.0319)
                                    .foregroundColor(.black)
                            }
                            
                        }.padding(.bottom,28)
                        
                        Image("NatalAcademy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width*0.917, height: UIScreen.main.bounds.height*0.106)
                        
                        
                        Image("HomeImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width*0.698, height: UIScreen.main.bounds.height*0.390)
                            .padding(.bottom,41)
                        
                        NavigationLink(destination: MasterView(viewModel: vm )) {
                            ZStack{
                                Rectangle()
                                    .fill(Color("GreenButton"))
                                    .frame(width: UIScreen.main.bounds.width*0.715, height: UIScreen.main.bounds.height*0.0722)
                                    .cornerRadius(30)
                                Text("Criar Sala")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        NavigationLink(destination: ContentView()) {
                            ZStack{
                                Rectangle()
                                    .fill(Color("RedButton"))
                                    .frame(width: UIScreen.main.bounds.width*0.715, height: UIScreen.main.bounds.height*0.0722)
                                    .cornerRadius(30)
                                Text("Entrar")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        
                        
                        Spacer()
                        
                    }.padding(18)
                }
                .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                }
            }
            .background(Color("Background"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
