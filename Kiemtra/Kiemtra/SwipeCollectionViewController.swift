//
//  SwipeCollectionViewController.swift
//  Kiemtra
//
//  Created by Xuan Huy on 11/14/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var pageModels =
        [
            PageModel(iamge: #imageLiteral(resourceName: "myuky1")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka5")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka4")),
            PageModel(iamge: #imageLiteral(resourceName: "myuky7")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka3")),
            PageModel(iamge: #imageLiteral(resourceName: "myuky6")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka4")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka2")),
            PageModel(iamge: #imageLiteral(resourceName: "myuky7")),
            PageModel(iamge: #imageLiteral(resourceName: "tohka5")),
            
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PageCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
        return pageModels.count
    }
    var selectedIndexPaths = IndexPath()
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCollectionCell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
//        cell.lifeFromeImageView.image = pageModels[indexPath.item].iamge
        cell.pageModel = pageModels[indexPath.item]
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("chon anh \(indexPath.item)")
            
        let imgselect = pageModels[indexPath.item]
        let vc = ImageViewController()
        vc.img = imgselect
        self.present(vc, animated: true) {
            print("chuyen man xong")
        }
    
        
    }
    // ham trong uicolectionviewdelegateflowlayout
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
