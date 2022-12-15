//
//  CloseView.swift
//  Sant Academy
//
//  Created by Anne Victoria Batista Auzier on 14/12/22.
//

import SwiftUI

struct CloseView: View {
    
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresent = false
    
    var body: some View {
        HStack{
            Spacer()
            VStack {
                Button(action: {
                    isCustomCameraViewPresent.toggle()
                }, label: {
                    ZStack{
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .padding(.top, 8)
                    }.padding(.top, 15)
                })
                .fullScreenCover(isPresented: $isCustomCameraViewPresent, content: {
                    CameraView(caturedImage: $capturedImage)
                })
                Spacer()
            }
        }
    }
}

