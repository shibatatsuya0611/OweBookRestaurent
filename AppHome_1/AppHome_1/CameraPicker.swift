//
//  CameraPicker.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/27/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class CameraPicker: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    var cameraImageView: UIImageView = UIImageView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("open camera")
        openCamera()
        autolayoutImage()
        view.reloadInputViews()
    }
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func autolayoutImage()
    {
        view.addSubview(cameraImageView)
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        cameraImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cameraImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cameraImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cameraImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cameraImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cameraImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image =  info[.editedImage] as? UIImage
        else
        {
            print("no image")
            return
        }
        print(image.size)
    }
}
