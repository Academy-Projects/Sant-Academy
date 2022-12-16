//
//  CameraView.swift
//  Sant Academy
//
//  Created by kevin marinho on 12/12/22.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    let cameraService = CameraService()
    @Binding var caturedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack{
            
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
                    }.frame(width: UIScreen.main.bounds.width*0.09, height: UIScreen.main.bounds.height*0.0426)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom,   8)
                .padding(.leading, 8)

                ZStack{
                    
                    CameraModel(cameraService: cameraService) { result in
                        switch result{
                            
                        case .success(let photo):
                            if let data = photo.fileDataRepresentation(){
                                caturedImage = UIImage(data: data)
                                //                        presentationMode.wrappedValue.dismiss()
                            }
                            else{
                                print("ERRO: Não foi encontrada nenhuma imagem.")
                            }
                        case .failure(let err):
                            print(err.localizedDescription)
                        }
                    }
                    Image("Moldura2")
                        .resizable()
                        .edgesIgnoringSafeArea(.bottom)
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            cameraService.capturePhoto()
                        }, label: {
                            ZStack{
                                Circle()
                                    .stroke(Color.redButton, lineWidth: 8)
                                    .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.08)
                                Circle()
                                    .fill(Color.greenButton)
                                    .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.07)
                                
                                Image(systemName: "camera")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.07, height: UIScreen.main.bounds.height * 0.025)
                            }
                        }).padding(.bottom, 55)
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

