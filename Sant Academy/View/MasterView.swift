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
            
            Color.background.edgesIgnoringSafeArea(.all)
            
            HStack(alignment: .center){
                
                ZStack(alignment: .top){

                    VStack(spacing: 0){
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            
                            ZStack{
                                Circle()
                                    .fill(Color.greenButton)
                                
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width*0.0426, height: UIScreen.main.bounds.height*0.09)
                            
                            
                        }

                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack{
                            Circle()
                                .fill(Color.greenButton)
                                .frame(width: UIScreen.main.bounds.width*0.1729)
                            
                            Circle()
                                .fill(Color.redButton)
                                .frame(width: UIScreen.main.bounds.width*0.1445)
                            
                            if viewModel.drawNumbers.isEmpty{
                                
                            } else {
                                Text(viewModel.drawNumbers.last!)
                                    .font(.system(size: 55))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .padding(.bottom, 33)
                        
                        Button {
                            print("clicked")
                            viewModel.raffle()
                            
                        } label: {
                            Text("Sortear")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .frame(width: UIScreen.main.bounds.width*0.2701, height: UIScreen.main.bounds.height*0.1282)
                                .background(Rectangle().fill(Color.yellowButton))
                                .cornerRadius(30)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)
                
                ZStack(alignment: .center){
                    
                    Rectangle()
                        .fill(Color.background)
                        .frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)
                    
                    VStack(spacing: 0){
                        
                        
                        Text("Histórico de bolas chamadas")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.top, 47)
                            .padding(.bottom, 17)
                        
                        
                        ScrollView(){
                            LazyVGrid(columns: columns){
                                
                                ForEach(viewModel.drawNumbers.sorted(), id: \.self ) { item in
                                    
                                    
                                    ZStack{
                                        Circle()
                                            .fill(Color.circleBackground)
                                        Text(item)
                                            .font(.system(size: 24))
                                            .fontWeight(.medium)
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.0785, height: UIScreen.main.bounds.height*0.1689)
                                    
                                }
                            }
                            
                        }.frame(width: UIScreen.main.bounds.width*0.44)
                        
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width*0.44, height: UIScreen.main.bounds.height*0.856)

            }

          Image("Luzes")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width*0.1291)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
        .onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscape
        }
        .onDisappear{
           // viewModel.resetGame()
        }
        
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
