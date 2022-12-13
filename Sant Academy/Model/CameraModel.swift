//
//  CameraModel.swift
//  Sant Academy
//
//  Created by kevin marinho on 12/12/22.
//

import Foundation
import AVFoundation
import SwiftUI

//class CameraModel: ObservableObject{
//    @Published var isTaken = false
//
//    @Published var session = AVCaptureSession()
//
//    @Published var alert = false
//
//    @Published var output = AVCapturePhotoOutput()
//
//    @Published var preview : AVCaptureVideoPreviewLayer!
//
//    func Check(){
//            switch AVCaptureDevice.authorizationStatus(for: .video){
//            case .authorized:
//                setUp()
//                return
//
//            case .notDetermined:
//                AVCaptureDevice.requestAccess(for: .video){(status) in
//                    if status{
//                        self.setUp()
//                    }
//                }
//            case .denied:
//                self.alert.toggle()
//                return
//            default:
//                return
//            }
//    }
//
//    func setUp(){
//        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back){
//            do{
//                self.session.beginConfiguration()
//
//                let input = try AVCaptureDeviceInput(device: device)
//
//                if self.session.canAddInput(input){
//                    self.session.addInput(input)
//                }
//
//                if self.session.canAddOutput(self.output){
//                    self.session.addOutput(self.output)
//                }
//                self.session.commitConfiguration()
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
//
//struct CameraPreview: UIViewRepresentable{
//    @ObservedObject var camera : CameraModel
//    func makeUIView(context: Context) -> some UIView {
//
//        let view = UIView(frame: UIScreen.main.bounds)
//        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
//        camera.preview.frame = view.frame
//
//        camera.preview.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(camera.preview)
//
//        camera.session.startRunning()
//
//        return view
//    }
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
//}


class CameraService {
    var session : AVCaptureSession?
    var delegate : AVCapturePhotoCaptureDelegate?
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping
    (Error?) -> ()) {
        self.delegate = delegate
        checkPermissions(completion: completion)
    }
    private func checkPermissions(completion: @escaping(Error?) ->()){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video){ granted in
                guard granted else { return }
                DispatchQueue.main.async {
                    self.setupCam(completion: completion)
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCam(completion: completion)
        @unknown default:
            break
        }
    }
    
    private func setupCam(completion: @escaping (Error?) -> ()){
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front){
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                }
                
                if session .canAddOutput(output){
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
            } catch {
                completion(error)
            }
        }
        
    }
    
    //    func setUp(){
    //        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back){
    //            do{
    //                self.session.beginConfiguration()
    //
    //                let input = try AVCaptureDeviceInput(device: device)
    //
    //                if self.session.canAddInput(input){
    //                    self.session.addInput(input)
    //                }
    //
    //                if self.session.canAddOutput(self.output){
    //                    self.session.addOutput(self.output)
    //                }
    //                self.session.commitConfiguration()
    //            }
    //            catch{
    //                print(error.localizedDescription)
    //            }
    //        }
    //    }
    //}
    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
        output.capturePhoto(with: settings, delegate: delegate!)
    }
}



struct CameraModel: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    let cameraService: CameraService
    let didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        cameraService.start(delegate: context.coordinator){ err in
            if let err = err {
                didFinishProcessingPhoto(.failure(err))
                return
            }
        }
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = viewController.view.bounds
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishProcessingPhoto: didFinishProcessingPhoto)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate{
        let parent: CameraModel
        private var didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
        
        init(_ parent: CameraModel,
             didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto, Error>) -> ()) {
            self.parent = parent
            self.didFinishProcessingPhoto = didFinishProcessingPhoto
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            if let error = error {
                didFinishProcessingPhoto(.failure(error))
                return
            }
            didFinishProcessingPhoto(.success(photo))
        }
    }
}


