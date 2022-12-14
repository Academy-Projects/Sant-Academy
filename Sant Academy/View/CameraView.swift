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
                        presentationMode.wrappedValue.dismiss()
                            
                    }
                    else{
                        print("erro: nao foi encontrada nenhuma imagem")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            VStack{
                Image("mold2")
                    .resizable()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        cameraService.capturePhoto()
                    }, label: {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 65, height: 65)
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 70, height: 70)
                        }
                    })
                    .padding(.bottom, 10)
                }
//                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//Image(systemName: "arrow.triangle.2.circlepath.camera")
//    .foregroundColor(.black)
//    .padding()
//    .background(Color.white)
//    .clipShape(Circle())
