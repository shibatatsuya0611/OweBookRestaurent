//
//  menuProfileCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class menuProfileCell: UICollectionViewCell
{
    var lbl_buttonTitle: UILabel = UILabel()
    func autolayoutBtn()
    {
        addSubview(lbl_buttonTitle)
        lbl_buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        lbl_buttonTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lbl_buttonTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_buttonTitle.topAnchor.constraint(equalTo: topAnchor).isActive  = true
        lbl_buttonTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lbl_buttonTitle.text = "Don Hang"
        lbl_buttonTitle.textColor = .white
        lbl_buttonTitle.textAlignment = .center
    }
    var titles: title!
    {
        didSet
        {
            lbl_buttonTitle.text = titles.title!
        }
    }
}
