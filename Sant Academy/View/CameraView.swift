//
//  CameraView.swift
//  Sant Academy
//
//  Created by kevin marinho on 12/12/22.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack{
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all)
            VStack{
                if camera.isTaken{
                    HStack {
                        Spacer()
                        Button(action: {camera.isTaken.toggle()}, label: {
                            ZStack{
                                Image(systemName: "arrow.triangle.2.circlepath.camera")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                            .padding(.trailing, 15)
                            .padding(.top,20)
                        })
                    }
                }
                Spacer()
                HStack{
//                  Condicional para tirar a foto quando o botao for clicado
                    if camera.isTaken{
                        Button(action: {}, label: {
                            Text("Salvar")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.leading)
                        Spacer()
                    }else{
                        Button(action: {camera.isTaken.toggle()}, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 70, height: 70)
                            }.padding(.bottom, 20)
                        })
                    }
                }.frame(height: 70)
            }
        }
        .onAppear(perform: {
            camera.Check()
        })
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
