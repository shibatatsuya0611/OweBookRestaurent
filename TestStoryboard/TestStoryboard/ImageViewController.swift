//
//  ImageViewController.swift
//  TestStoryboard
//
//  Created by Xuan Huy on 11/19/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit


class ImageViewController: UIViewController {

    var img: Characters?
    
    @IBOutlet weak var imageView: UIImageView?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Image View")
//        imageView?.image = UIImage(named: img?.imageName ?? "")
        imageAfterPush()
        
        // Do any additional setup after loading the view.
       
    }
   
    func imageAfterPush()
    {
        if let img = self.img
               {

                   imageView?.image = UIImage(named: img.imageName ?? "")
                print("anh: \(img)")
               }
               else
               {
                   imageView?.image = #imageLiteral(resourceName: "tohka1")
               }
    }
}
