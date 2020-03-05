//
//  ViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 17/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import AVFoundation
import UIKit

@available(iOS 13.0, *)
class qrViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet var videoPreview: UIView!
    var stringNum = String()

    
    let avCaptureSession = AVCaptureSession()
    enum error: Error{
        case noCameraAvailble
        case videoInputInitFail
    }
    
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        do{
            try scanQRCode()
            
        } catch {
            print("Failed to scan")
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr {
                stringNum = machineReadableCode.stringValue!

                if stringNum == "1"
                {
                    self.performSegue(withIdentifier: "toorchestre",sender:self)
                    self.avCaptureSession.stopRunning()
                }
                if stringNum == "2"
                {
                    self.performSegue(withIdentifier: "toproductions",sender:self)
                    self.avCaptureSession.stopRunning()
                }
                if stringNum == "3"
                {
                    self.performSegue(withIdentifier: "toquestions",sender:self)
                    self.avCaptureSession.stopRunning()
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toorchestre"
        {
            let dest = segue.destination as! lorchestreViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        if segue.identifier == "toproductions"
        {
            let dest = segue.destination as! LesProductionsViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
        if segue.identifier == "toquestions"
        {
            let dest = segue.destination as! QuizClassViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoom)
        }
        
    }

    
    func scanQRCode() throws {
        
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("No camera.")
            throw error.noCameraAvailble
        }
        
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else {
            print("Failed to init camera.")
            throw error.videoInputInitFail
        }
    
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        avCaptureSession.startRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func backtowelcomepage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backtowelcomepage", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
