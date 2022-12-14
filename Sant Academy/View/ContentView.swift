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
    @State var items : [Any] = []
    @State var sheet = false
     
    var body: some View {
        ZStack{
            if let capturedImage = capturedImage {
                ZStack{
                    Image(uiImage: capturedImage)
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    Image("mold2")
                        .resizable()
                    Button(action: {
                        guard let images = ImageRenderer(content: body).uiImage else{ return }
                        items.removeAll()
                        items.append(images)
                        sheet.toggle()
                    }, label: {
                        Text("share")
                            .fontWeight(.heavy)
                    })
                }
            } else {
                Image("mold2")
                    .resizable()
                Color(UIColor.systemBackground)
            }
            VStack {
                Spacer()

                Button("click to save"){
                    guard let image = ImageRenderer(content: body).uiImage else{
                        return
                    }
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
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
            .sheet(isPresented: $sheet, content: {
                ShareSheet(items: items)
            })
            .padding()
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

@MainActor
private func generateSnapshot() -> UIImage {
    let renderer = ImageRenderer(content: ContentView())
 
    return renderer.uiImage ?? UIImage()
}
