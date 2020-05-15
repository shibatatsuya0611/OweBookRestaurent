//
//  NewCharViewController.swift
//  Bai12
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class NewCharViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtCharName: UITextField?
    @IBOutlet weak var imageViewChar: UIImageView?
    @IBOutlet weak var lblrating: UILabel?
    
    var newChar = Character()
    
    @IBAction func btnSave(sender: UIButton)
    {
        print("Press Save")
        if (newChar.image == nil || newChar.rating ?? 0 < 1 || newChar.CharacterName?.count == 0)
        {
            let alertController = UIAlertController(title: "Alert", message: "Vui long nhap ten character, chon anh va binh chon thu hang", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {(action) in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion:  nil)
        }
        else
        {
            // add new char
            Characters.append(newChar)
            navigationController?.popViewController(animated: true)
            let mainviewController = self.navigationController?.topViewController as? ViewController
            mainviewController?.tableView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // cham vao image view
        let tapGestureToImageView = UITapGestureRecognizer(target: self, action: #selector(tapToImageView(sender:)))
        imageViewChar?.isUserInteractionEnabled = true
        imageViewChar?.addGestureRecognizer(tapGestureToImageView)
        // pan to lblRating
        
        let panGestureToLabelRating = UIPanGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        lblrating?.isUserInteractionEnabled = true
        lblrating?.addGestureRecognizer(panGestureToLabelRating)
        
        // tap to lblrating
        let tapGestureToLabelRating = UITapGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        tapGestureToLabelRating.numberOfTapsRequired = 1
        lblrating?.addGestureRecognizer(tapGestureToLabelRating)
    }
    @objc func panInLabelRating(sender: UIPanGestureRecognizer)
    {
        let locationView = sender.location(in: self.view) // vi tri cham tay vao
        let newLabelRatingFrame = self.view.convert(lblrating!.frame, from: lblrating?.superview)
        let frame1 = CGRect(x: newLabelRatingFrame.origin.x,
                            y:newLabelRatingFrame.origin.y,
                            width: newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame2 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: 2 * newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame3 = CGRect(x: newLabelRatingFrame.origin.x,
                           y: newLabelRatingFrame.origin.y,
                           width: 3 * newLabelRatingFrame.size.width / 5,
                           height: newLabelRatingFrame.size.height)
        let frame4 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: 4 * newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame5 = newLabelRatingFrame
        if (frame1.contains(locationView))
        {
            lblrating?.text = "★☆☆☆☆"
            print("1 sao")
            newChar.rating = 1
        }
        else if (frame2.contains(locationView))
        {
            lblrating?.text = "★★☆☆☆"
            newChar.rating = 2
            print("2 sao")
        }
        else if ( frame3.contains(locationView))
        {
            lblrating?.text = "★★★☆☆"
            newChar.rating = 3
            print("3 sao")
        }
        else if (frame4.contains(locationView))
        {
            lblrating?.text = "★★★★☆"
            newChar.rating = 4
            print("4 sao")
        }
        else if (frame5.contains(locationView))
        {
            lblrating?.text = "★★★★★"
            newChar.rating = 5
            print("5 sao")
        }
    }
    
    // su dung ham trong UINavigationDelegate
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let chosenImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imageViewChar!.image = chosenImage
        newChar.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func tapToImageView(sender: UITapGestureRecognizer)
    {
        // thao tac voi img
        print("Tap to imageView")
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    // su dung ham tu uItextfielDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        newChar.CharacterName = textField.text ?? ""
        textField.resignFirstResponder()
    }
}
