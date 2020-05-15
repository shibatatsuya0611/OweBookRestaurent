//
//  checkCamera.swift
//  EasyFood Merchant
//
//  Created by phuong on 12/20/19.
//  Copyright © 2019 EasyFoodMerchant. All rights reserved.
//

import UIKit
import AVFoundation

class PickerImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker: UIImage?
    func cameraSelected() {
            // First we check if the device has a camera (otherwise will crash in Simulator - also, some iPod touch models do not have a camera).
            let deviceHasCamera = UIImagePickerController.isSourceTypeAvailable(.camera)
            if deviceHasCamera {
                let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
                switch authStatus {
                    case .authorized:
                        showCameraPicker()
                    case .denied:
                        alertPromptToAllowCameraAccessViaSettings()
                    case .notDetermined:
                        permissionPrimeCameraAccess()
                    default:
                        permissionPrimeCameraAccess()
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: "Thiết bị không có máy ảnh", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
    //                Analytics.track(event: .permissionsPrimeCameraNoCamera)
                })
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }


        func alertPromptToAllowCameraAccessViaSettings() {
            let alert = UIAlertController(title: "Easy Food muốn sử dụng máy ảnh", message: "Đi đến cài đặt để cấp quyền truy cập máy ảnh", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Open Settings", style: .cancel) { alert in
    //            Analytics.track(event: .permissionsPrimeCameraOpenSettings)
                if let appSettingsURL = NSURL(string: UIApplication.openSettingsURLString) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(appSettingsURL as URL, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                        UIApplication.shared.openURL(appSettingsURL as URL)
                    }
                }
            })
            present(alert, animated: true, completion: nil)
        }


        func permissionPrimeCameraAccess() {
            let alert = UIAlertController(title: "Easy Food muốn sử dụng máy ảnh", message: "Đi đến cài đặt để cấp quyền truy cập máy ảnh", preferredStyle: .alert )
            let allowAction = UIAlertAction(title: "Allow", style: .default, handler: { (alert) -> Void in
    //            Analytics.track(event: .permissionsPrimeCameraAccepted)
//                AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { [weak self] granted in
                    DispatchQueue.main.async {
                        self?.cameraSelected() // try again
                    }
                })
            })
            alert.addAction(allowAction)
            let declineAction = UIAlertAction(title: "Not Now", style: .cancel) { (alert) in
    //            Analytics.track(event: .permissionsPrimeCameraCancelled)
            }
            alert.addAction(declineAction)
            present(alert, animated: true, completion: nil)
        }


        func showCameraPicker() {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.modalPresentationStyle = UIModalPresentationStyle.currentContext
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerController.SourceType.camera
            present(picker, animated: true, completion: nil)
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("user cancel camera")
            picker.dismiss(animated: true ) {
                self.view.layoutIfNeeded()
            }
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] else {
                return
            }
            
                        
                if mediaType as? String ?? ""  == "public.image" {
                    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { picker.dismiss(animated: true, completion: nil); return }
                    
                    picker.dismiss(animated: true) {
                        self.imagePicker = image
                        self.view.layoutIfNeeded()
                    }
                    
                }
        }
}
