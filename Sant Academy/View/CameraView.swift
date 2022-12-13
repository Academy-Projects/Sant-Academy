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
                    }else{
                        print("erro: nao foi encontrada nenhuma imagem")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            VStack{
                HStack {
                    Spacer()
                    Button(action: {
                        cameraService.capturePhoto()
                    }, label: {
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
                Spacer()
            }
        }
    }
}
