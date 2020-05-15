////
////  ImageExtension.swift
////  AppHome_1
////
////  Created by Xuan Huy on 11/28/19.
////  Copyright © 2019 Xuan Huy. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension UIImage
//{
//  func crop(to:CGSize) -> UIImage
//  {
//    guard let cgimage = self.cgImage else { return self }
//
//    let contextImage: UIImage = UIImage(cgImage: cgimage)
//
//    let contextSize: CGSize = contextImage.size
//
//    //Set to square
//    var posX: CGFloat = 0.0
//    var posY: CGFloat = 0.0
//    let cropAspect: CGFloat = to.width / to.height
//
//    var cropWidth: CGFloat = to.width
//    var cropHeight: CGFloat = to.height
//
//    if to.width > to.height
//    { //Landscape
//        cropWidth = contextSize.width
//        cropHeight = contextSize.width / cropAspect
//        posY = (contextSize.height - cropHeight) / 2
//    }
//    else if to.width < to.height
//    { //Portrait
//        cropHeight = contextSize.height
//        cropWidth = contextSize.height * cropAspect
//        posX = (contextSize.width - cropWidth) / 2
//    }
//    else
//    { //Square
//        if contextSize.width >= contextSize.height
//        { //Square on landscape (or square)
//            cropHeight = contextSize.height
//            cropWidth = contextSize.height * cropAspect
//            posX = (contextSize.width - cropWidth) / 2
//        }
//        else
//        { //Square on portrait
//            cropWidth = contextSize.width
//            cropHeight = contextSize.width / cropAspect
//            posY = (contextSize.height - cropHeight) / 2
//        }
//    }
//
//    let rect: CGRect = CGRect(x : posX, y : posY, width : cropWidth, height : cropHeight)
//
//    // Create bitmap image from context using the rect
//    let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
//
//    // Create a new image based on the imageRef and rotate back to the original orientation
//    let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
//
//    cropped.draw(in: CGRect(x : 0, y : 0, width : to.width, height : to.height))
//
//    return cropped
//  }
//}
