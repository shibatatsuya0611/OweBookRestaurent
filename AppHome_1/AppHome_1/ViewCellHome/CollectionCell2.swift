//
//  CollectionCell2.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/25/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class CollectionCell2: UICollectionViewCell {
    
    var imageView: UIImageView = UIImageView()
    var lblMenuName: UILabel = UILabel()
    var lblDescription: UILabel = UILabel()
    
    func autolayoutcell()
    {
        self.backgroundColor = .clear
        
        addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "MonAn")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1 / 1.5).isActive = true
        
        // label menu Name
        
        addSubview(lblMenuName)
        lblMenuName.translatesAutoresizingMaskIntoConstraints = false
        lblMenuName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        lblMenuName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblMenuName.text = "Mon an ngon"
        lblMenuName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblMenuName.center = center
        
        
        // label Description
        
        addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.topAnchor.constraint(equalTo: lblMenuName.bottomAnchor, constant: 5).isActive = true
        lblDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        lblDescription.text = "Tìm kiếm tất cả món ăn hấp dẫn cho bạn"
        lblDescription.font = UIFont.systemFont(ofSize: 10)
        lblDescription.textAlignment = .center
        lblDescription.numberOfLines = 0
    }
    var menu: ImageMenu!
    {
        didSet
        {
            imageView.image = UIImage(named: menu.imageName!)
            lblMenuName.text = menu.menuName!
            lblDescription.text = menu.description!
        }
    }
}
