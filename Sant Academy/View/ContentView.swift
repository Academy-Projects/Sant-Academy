//
//  ContentView.swift
//  Sant Academy
//
//  Created by kevin marinho on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresent = false
     
    var body: some View {
        ZStack{
            if capturedImage != nil{
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }else {
                Color(UIColor.systemBackground)
            }
            VStack {
                Spacer()
                Button(action: {
                    isCustomCameraViewPresent.toggle()
                    
                }, label: {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 65, height: 65)
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 70, height: 70)
                        }.padding(.bottom, 20)
                    })
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresent, content: {
                    CameraView(caturedImage: $capturedImage)
                })
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
