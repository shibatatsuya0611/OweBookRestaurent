//
//  PageCollectionCell.swift
//  BAI17
//
//  Created by Xuan Huy on 11/11/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class PageCollectionCell: UICollectionViewCell
{
    // controller
    var pageModel: PageModel?
    {
        didSet
        { 
         // day la ham setter. co the lam viec voi cac ham private
            lifeFromImageView.image = pageModel?.image
            titleTextView.text = pageModel?.headerText ?? ""
            titleTextView.textAlignment = .center
        }
    }
    let topHalfView: UIView =
        {
           let view = UIView()
    //        view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
       private let lifeFromImageView: UIImageView = {
            // day la closure cua image
            
            let imageView = UIImageView(image: #imageLiteral(resourceName: "tohka2"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
       private let titleTextView: UITextView = {
            let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.font = UIFont.boldSystemFont(ofSize: 18)
            textView.text = " U R Well Come bla"
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.textAlignment = .center
            textView.backgroundColor = UIColor.clear
            return textView
        }()
    fileprivate func autolayoutUI()
    {
        backgroundColor = .white
         // Do any additional setup after loading the view.
        addSubview(topHalfView)
        
        NSLayoutConstraint.activate([topHalfView.topAnchor.constraint(equalTo: topAnchor),
                                     topHalfView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     topHalfView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     topHalfView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        
        ])
        
         topHalfView.addSubview(lifeFromImageView)
         
         lifeFromImageView.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
         lifeFromImageView.centerYAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
         lifeFromImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
         lifeFromImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
         
         // title text
        
         addSubview(titleTextView)
         
         titleTextView.topAnchor.constraint(equalTo: lifeFromImageView.bottomAnchor, constant: 20).isActive = true
         titleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
         titleTextView.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -20).isActive = true
         titleTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        //self.backgroundColor = .yellow
        autolayoutUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
