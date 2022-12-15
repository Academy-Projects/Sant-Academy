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
            ZStack{
                Image("MolduraMenor")
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
                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.1)
                            Circle()
                                .fill(Color.greenButton)
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.09)
                                
                            Image(systemName: "camera")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width * 0.09, height: UIScreen.main.bounds.height * 0.03)
                        }
                    }).padding(.bottom, 30)
                }
            }
        }
    }
}

