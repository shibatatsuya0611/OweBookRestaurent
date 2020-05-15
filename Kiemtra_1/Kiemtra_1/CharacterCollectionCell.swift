//
//  CharacterCollectionCell.swift
//  Kiemtra_1
//
//  Created by Xuan Huy on 11/15/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit


class CharacterCollectionCell: UICollectionViewCell
{
    
    var imageView: UIImageView = UIImageView()
    
    func autolayoutCell()
    {
        self.backgroundColor = .red
        
        //autolayout ImageView
        addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "tohka4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        //stackviewsetting
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 10
    }
    
    var char: Character!
    {
        didSet
        {
            imageView.image = UIImage(named: char.imageName!)
        }
    }
}
