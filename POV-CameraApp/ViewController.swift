//
//  ViewController.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 10/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var cameraView: UIImageView!
    
    var captureSession = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var capturePhotoOutput: AVCapturePhotoOutput?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.4, *) {
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.layer.bounds
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
            }
            catch
                {
                    print("error")
                }
        }
        
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoOutput?.isHighResolutionCaptureEnabled = true
        captureSession.addOutput(capturePhotoOutput!)
        
    }
    
    @IBAction func imageCapture(_ sender: Any)
    {
        guard let capturePhotoOutput = self.capturePhotoOutput else { return }
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
        
    }
    
    func switchToFrontCamera() {
        if frontCamera?.isConnected == true {
            captureSession.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.layer.bounds
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
            } catch {
                print("error")
            }
        }
    }
    
    func switchToBackCamera() {
        if backCamera?.isConnected == true {
            captureSession.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.layer.bounds
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
            } catch {
                print("error")
            }
        }
    }
    
    @IBAction func rotateCamera(_ sender: Any) {
        guard let currentCameraInput: AVCaptureInput = captureSession.inputs.first else {
            return
        }
        
        if let input = currentCameraInput as? AVCaptureDeviceInput {
            if input.device.position == .back {
                switchToFrontCamera()
            }
            if input.device.position == .front {
                switchToBackCamera()
            }
        }
    }
    
    @IBAction func showInfo(_ sender: UIButton) {
        
    }
}

extension ViewController : AVCapturePhotoCaptureDelegate
{
func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,
                 previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings,
                 bracketSettings backetSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
                        guard error == nil,
                            let photoSampleBuffer = photoSampleBuffer else {
                                print("Error")
                                return
                            }
                        guard let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {
                                    return
                            }
                        let capturedImage = UIImage.init(data: imageData, scale: 1.0)
                        if let image = capturedImage {
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                    }
}

