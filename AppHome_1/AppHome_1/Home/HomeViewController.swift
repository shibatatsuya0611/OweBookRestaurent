//
//  HomeViewController.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import SQLite

class HomeViewController: UIViewController {

    let collectionview: HomeCollectionView =
    {
        let coll = HomeCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        coll.translatesAutoresizingMaskIntoConstraints = false
        
        return coll
    }()
    
    let imgBanner: UIImageView =
    {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "icon-default-restaurant")
        
        return img
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Chức năng chính"
        view.backgroundColor = bgcolorHoSoRestaur
        
        setupView()
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.view.setNeedsLayout() // force update layout
        navigationController?.view.layoutIfNeeded() // to fix height of the navigation bar
    }
    
    fileprivate func setupView()
    {
        view.addSubview(imgBanner)
        view.addSubview(collectionview)
        
        imgBanner.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: self.view.frame.height / 4))
        
        collectionview.anchor(top: imgBanner.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .zero)
    }
}
