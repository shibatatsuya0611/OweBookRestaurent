//
//  MainViewController.swift
//  Bai5
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var btnChooseImageSource: UIButton?
    @IBOutlet weak var imageView: UIImageView?
    
    var arletController: UIAlertController?
    var pickerController: UIImagePickerController?
    
    @IBAction func btnChooseImageSource(sender: UIButton)
    {
        arletController = UIAlertController(title: "take image", message: "chose ur image soure", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {(action) in
            print("You choose Camera")
            self.openCamera()
        }
        let photoAtion = UIAlertAction(title: "Your Photo", style: .default){(action) in
            print("Choose Photo")
            self.openPhoto()
        }
        arletController?.addAction(cameraAction)
        arletController?.addAction(photoAtion)
        arletController?.view.tintColor = UIColor.magenta
        self.present(arletController!, animated: true)
        {
            print("present")
        }
    }
    func openCamera()
    {
        pickerController = UIImagePickerController()
        if(UIImagePickerController.isSourceTypeAvailable(.camera) == false)
        {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true)
        {
            print("presented camera")
        }
    }
    func openPhoto()
    {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true, completion: nil)
    }
    // day la phuong thuc cua UINavigationControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        picker.dismiss(animated: true, completion: {
            let activityindicatorView = UIActivityIndicatorView(style: .whiteLarge)
            activityindicatorView.color = UIColor.red
            self.view.addSubview(activityindicatorView)
            activityindicatorView.frame = self.view.frame
            activityindicatorView.center = self.view.center
            activityindicatorView.startAnimating()
            DispatchQueue.global().async
                {
                    // co viec khac
                    for index in 1...100000
                    {
                        print(index)
                    }
                    // sau khi lam xong
                    DispatchQueue.main.async {
                        self.imageView?.image = chooseImage
                        activityindicatorView.stopAnimating()
                    }
                }
        })
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.verifyInformation()
    }
   func verifyInformation()
   {
    arletController = UIAlertController(title: "Verify", message: "nhap name hoac pass", preferredStyle: .alert)
    arletController?.addTextField(configurationHandler: {(textField) in
        textField.placeholder = "Enter email"
        textField.keyboardType = .emailAddress
    })
    arletController?.addTextField(configurationHandler: {(textField) in
        textField.placeholder = "Nhap Pass"
        textField.isSecureTextEntry = true // password kieu ***
    })
    let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
        let textFieldEmail = self.arletController!.textFields![0] as UITextField
        let textFieldPassword = self.arletController!.textFields![1] as UITextField
        if (textFieldEmail.text != "shibatatsuya@gmail.com" || textFieldPassword.text != "1234")
        {
            self.verifyInformation()
        }
    }
    arletController?.addAction(okAction)
    self.present(arletController!, animated: true, completion: nil)
    }

}
