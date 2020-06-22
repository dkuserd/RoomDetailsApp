//
//  RoomBookingQRScanner.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 22/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class RoomBookingQRScanner: UIViewController {
    var avCaptureSession: AVCaptureSession!
    var avPreviewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        avCaptureSession = AVCaptureSession()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
                self.failureError()
                return
            }
            let avVideoInput: AVCaptureDeviceInput
            
            do {
                avVideoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                self.failureError()
                return
            }
            
            if (self.avCaptureSession.canAddInput(avVideoInput)) {
                self.avCaptureSession.addInput(avVideoInput)
            } else {
                self.failureError()
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if (self.avCaptureSession.canAddOutput(metadataOutput)) {
                self.avCaptureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr]
            } else {
                self.failureError()
                return
            }

        self.avPreviewLayer = AVCaptureVideoPreviewLayer(session: self.avCaptureSession)
            self.avPreviewLayer.frame = self.view.layer.bounds
            self.avPreviewLayer.videoGravity = .resizeAspectFill
            self.view.layer.addSublayer(self.avPreviewLayer)
            self.avCaptureSession.startRunning()
        }
    }
    
    func failureError() {
         let alertController = UIAlertController(title: "Phone not supported", message: "Please check device camera", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Okay", style: .default))
         present(alertController, animated: true)
         avCaptureSession = nil
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (avCaptureSession?.isRunning == false) {
                  avCaptureSession.startRunning()
              }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (avCaptureSession?.isRunning == true) {
            avCaptureSession.stopRunning()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

extension RoomBookingQRScanner: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        avCaptureSession.stopRunning()
        
        if let metaObjects = metadataObjects.first {
            guard let readableObject = metaObjects as? AVMetadataMachineReadableCodeObject else { return }
                       guard let stringValue = readableObject.stringValue else { return }
                       AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                       readQRCode(code: stringValue)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func readQRCode(code: String) {
        let vc = RoomBookingWebView()
        navigationController?.pushViewController(vc, animated: true)
        vc.loadUrlFromQR = code
        print("QR Code is read", code)
    }
}
