//
//  ImageViewController.swift
//  Kiemtra
//
//  Created by Xuan Huy on 11/14/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageView"

class ImageViewController: UIViewController {

    var myImageView: UIImageView!
    var selectedImage:UIImage!
    
    var img: PageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ImageViewController")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        let imageUrl = self.selectedImage
            
            if(imageUrl != nil)
            {
                self.myImageView.image = UIImage()
            }
           
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
