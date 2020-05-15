//
//  ImageViewController.swift
//  Kiemtra_1
//
//  Created by Xuan Huy on 11/15/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

//    var img: Character?
    var img: UIImage?
    var imageView: UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        autolayoutImage()
        
      let btnback = UIButton()
       btnback.setTitle("Back", for: .normal)
       btnback.setTitleColor(UIColor.blue, for: .normal)
       btnback.frame = CGRect(x: -100, y: -150, width: 300 , height: 500)
       btnback.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
       view.addSubview(btnback)
        print(" da sang ImageViewController")
        // Do any additional setup after loading the view.
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationItem.backBarButtonItem?.title = "Back"
       print("hello viewwillappere")
    }
    @objc func pressed(sender: UIButton!)
                {
                    self.navigationController?.popToRootViewController(animated: true)
                    print("Back")
                }
           
    func autolayoutImage()
    {
        view.addSubview(imageView)
        //autolayout ImageView
        if let img = self.img {
//            imageView.image = UIImage(named: img.imageName ?? "")
            imageView.image = img
        } else {
            imageView.image = #imageLiteral(resourceName: "tohka6")
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}
