//
//  PageCollectionCell.swift
//  Kiemtra
//
//  Created by Xuan Huy on 11/14/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class PageCollectionCell: UICollectionViewCell {
    
    //Controller
    var pageModel: PageModel?
    {
        didSet
        {
            lifeFromeImageView.image = pageModel?.iamge
        }
    }
    
    let topHalfView: UIView =
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let lifeFromeImageView: UIImageView =
    {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tohka3") )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    fileprivate func autolayoutUI()
    {
        backgroundColor = .white
        addSubview(topHalfView)
        NSLayoutConstraint.activate([topHalfView.topAnchor.constraint(equalTo: topAnchor),
                                     topHalfView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     topHalfView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     topHalfView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
        
        ])
        topHalfView.addSubview(lifeFromeImageView)
        lifeFromeImageView.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
        lifeFromeImageView.centerYAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
        lifeFromeImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lifeFromeImageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        autolayoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
