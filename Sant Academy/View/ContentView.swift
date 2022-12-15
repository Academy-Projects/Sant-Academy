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
                    HStack {
                        VStack {
                            Spacer()
                            Button(action: {
                                showingOptions = true
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 30, height: 35)
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
                        }
                        .padding(.leading, 15)
                        .padding(.bottom, 50)
                        Spacer()
                    }
                    
                    CloseView()
                    
                        .sheet(isPresented: $sheet, content: {
                            ShareSheet(items: items)
                        })
                        .padding()
                }
            } else {
                CameraView(caturedImage: $capturedImage)
            }
        }
    }
    var creenshot: some View{
        ZStack{
            if let capturedImage = capturedImage {
                Image(uiImage: capturedImage)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                Image("mold3")
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


//Image("mold2")
// .resizable()
//Color(UIColor.systemBackground)
