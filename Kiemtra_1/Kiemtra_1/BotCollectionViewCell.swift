//
//  BotCollectionViewCell.swift
//  Kiemtra_1
//
//  Created by Xuan Huy on 11/21/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class BotCollectionViewCell: UICollectionViewCell
{
    var imageView: UIImageView = UIImageView()
    
    func autolayoutCell()
    {
        self.backgroundColor = .red
        
        //autolayout ImageView
        addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "tohka5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    var char: Character!
    {
        didSet
        {
            imageView.image = UIImage(named: char.imageName!)
        }
    }
}
