//
//  UIImage_Extension.swift
//  Bai4
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import  UIKit

extension UIImageView
{
    public func getImageFromURL(urlString: String)
    {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: {(data,responds,error) -> Void in
            if error != nil
                {
                    print("error")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                })
            }).resume()
    }
}
