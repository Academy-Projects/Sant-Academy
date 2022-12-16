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
    @State var confeteBool = false
    
    var body: some View {
      
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
                                Text("Sortear")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        NavigationLink(destination: BangoView()) {
                            ZStack{
                                Rectangle()
                                    .fill(Color("RedButton"))
                                    .frame(width: UIScreen.main.bounds.width*0.715, height: UIScreen.main.bounds.height*0.0722)
                                    .cornerRadius(30)
                                Text("Nova Cartela")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                            }

                        }

                        Spacer()
                        
                    }.padding(18)
                }
                .background(Color("Background"))
                .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                
        }
    }
}

struct congrats: View{
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.blue)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: -100, y : -50)
            
            Circle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: 60, y : 70)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
