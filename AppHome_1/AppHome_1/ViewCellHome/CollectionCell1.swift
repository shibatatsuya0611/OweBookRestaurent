//
//  CollectionCell1.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/25/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class CollectionCell1: UICollectionViewCell {
    
    var imageView: UIImageView = UIImageView()
    
    func autolayoutcell()
    {
        self.backgroundColor = .white
        
        addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "AnVat")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
       imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
    var banners: Banner!
    {
        didSet
        {
            imageView.image = UIImage(named: banners.imageName!)
        }
    }

}
