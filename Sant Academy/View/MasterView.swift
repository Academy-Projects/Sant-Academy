//
//  MasterView.swift
//  Sant Academy
//
//  Created by Letícia Victoria das Neves Sales on 15/12/22.
//

import SwiftUI

struct MasterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: MasterView.ViewModel) {
        self.viewModel = viewModel
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack{
            
//            VStack(spacing: 0){
                
//                Button {
//                    //   presentationMode.wrappedValue.dismiss()
//                } label: {
//
//                    ZStack{
//                        Circle()
//                            .fill(Color.black)
//
//                        Image(systemName: "chevron.left")
//                            .font(.system(size: 24))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: UIScreen.main.bounds.width*0.0426, height: UIScreen.main.bounds.height*0.09)
//
//
//                }
//                .padding(.top, 47)
//                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .center){
                    
                    ZStack(alignment: .top){
                     //     Color.gray
                        VStack(spacing: 0){
                            
                            Button{
                                   presentationMode.wrappedValue.dismiss()
//                                HomeView()
                                
                            } label: {
                                
                                ZStack{
                                    Circle()
                                        .fill(Color.black)
                                    
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 24))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                }
                                .frame(width: UIScreen.main.bounds.width*0.0426, height: UIScreen.main.bounds.height*0.09)
                                
                                
                            }
                           // .padding(.top, 47)
                            .frame(maxWidth: .infinity, alignment: .leading)
                      
                            Text("Número da Sala")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 17)
                            
                            ZStack{
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: UIScreen.main.bounds.width*0.1729)
                                    
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: UIScreen.main.bounds.width*0.1445)
                            }
                            .padding(.bottom, 33)

                            Button {
                                print("clicked")
                            } label: {
                                Text("Sortear")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .frame(width: UIScreen.main.bounds.width*0.2701, height: UIScreen.main.bounds.height*0.1282)
                                    .background(Rectangle().fill(Color.black))
                                    .cornerRadius(22)
                            }
                            
                           // Spacer()
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)
                    
                    //Spacer()
                    
                    ZStack(alignment: .center){
                        VStack(spacing: 0){
 
                            
                            Text("Histórico de bolas chamadas")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 17)
                            
                            LazyVGrid(columns: columns){
                                
                                ForEach(viewModel.drawNumbers, id: \.self ) { item in
                                    
                                    ZStack{
                                        Circle()
                                            .fill(Color.gray)
                                        Text(item)
                                            .font(.system(size: 28))
                                            .fontWeight(.medium)
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.0785, height: UIScreen.main.bounds.height*0.1689)
                                    
                                }
                            }
                            //                        NavigationLink {
                            //                            ContentView()
                            //                        } label: {
                            //                            Text("Camera")
                            //                        }
                            
                          //  Spacer()
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }.frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)
                    
                    
                    
                    .frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)
                }
//            }
//            .frame(width: UIScreen.main.bounds.width*0.88, height: UIScreen.main.bounds.height*0.856)
        }
        .navigationBarHidden(true)
        .onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscape
        }
        //        .onDisappear{
        //            AppDelegate.orientationLock = .all
        //        }
        //
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MasterView.ViewModel()
        
        MasterView(viewModel: vm)
            .previewInterfaceOrientation(.landscapeLeft)
            .onAppear {
                for _ in 0..<12 {
                    vm.raffle()
                }
            }
        
    }
}
