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
    @State private var showingOptions = false
    @State var items : [Any] = []
    @State var sheet = false
    
    var body: some View {
        ZStack{
            if capturedImage != nil {
                ZStack{
                    creenshot
//                        .scaledToFit()
                    HStack {
                        VStack {
                            Button(action: {
//                                isCustomCameraViewPresent.toggle()
                                capturedImage = nil
                            }, label: {
                                ZStack{
                                    Image(systemName: "x.circle.fill")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width * 0.072, height: UIScreen.main.bounds.height * 0.033)
//                                        .padding(.top, 8)
                                }
                            })
                            .fullScreenCover(isPresented: $isCustomCameraViewPresent, content: {
                                CameraView(caturedImage: $capturedImage)
                            })
                            Spacer()
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                showingOptions = true
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.054, height: UIScreen.main.bounds.height * 0.033)
                                    .foregroundColor(.white)
                            })
                            .confirmationDialog("", isPresented: $showingOptions, titleVisibility: .hidden){
                                Button(action: {
                                    guard let images = ImageRenderer(content: creenshot).uiImage else{ return }
                                    items.removeAll()
                                    items.append(images)
                                    sheet.toggle()
                                }, label: {
                                    Text("Compartilhar")
                                        .fontWeight(.heavy)
                                })
                                Button("Salvar") {
                                    guard let image = ImageRenderer(content: creenshot).uiImage else{
                                        return
                                    }
                                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                }
                            }
                            Spacer()
                        }
                    }
                        .sheet(isPresented: $sheet, content: {
                            ShareSheet(items: items)
                        })
                        .padding()
                }
            } else {
                CameraView(caturedImage: $capturedImage)
            }
        }.navigationBarHidden(true)
    }
    var creenshot: some View{
        ZStack{
            if let capturedImage = capturedImage {
                Image(uiImage: capturedImage)
                    .resizable()
                    .scaledToFit()

                Image("Moldura2")
                    .resizable()
            }else {
                CameraView(caturedImage: $capturedImage)
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable{
    
    var items : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
