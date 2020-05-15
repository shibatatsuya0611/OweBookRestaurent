//
//  ExtensionFoodViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/9/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

extension FoodViewController
{
    
    func searchBarItem()
    {
        searchBar.placeholder = "Search"
        let leftNavBarBtn = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarBtn
    }
    func autolayoutUI()
    {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2).isActive = true
        
        //totalView
        scrollView.addSubview(totalView!)
        totalView?.translatesAutoresizingMaskIntoConstraints = false
        totalView?.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        totalView?.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        totalView?.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        totalView?.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        //lblGoiy
        totalView?.addSubview(lbl_GoiY)
        lbl_GoiY.translatesAutoresizingMaskIntoConstraints = false
        lbl_GoiY.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        lbl_GoiY.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        lbl_GoiY.topAnchor.constraint(equalTo: totalView!.topAnchor).isActive = true
        lbl_GoiY.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        lbl_GoiY.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl_GoiY.backgroundColor = .lightGray
        lbl_GoiY.text = "Goi y mot vai mon an ngon cho hom nay"
        lbl_GoiY.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        lbl_GoiY.textAlignment = .center
        
//        var collectionviewTop: UICollectionView?
        totalView?.addSubview(collectionviewTop)
        collectionviewTop.translatesAutoresizingMaskIntoConstraints = true
        collectionviewTop.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        collectionviewTop.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        collectionviewTop.topAnchor.constraint(equalTo: lbl_GoiY.bottomAnchor, constant: 3).isActive = true
        collectionviewTop.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        collectionviewTop.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5).isActive = true
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionviewTop.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        
//        var lbl_popularFood: UILabel = UILabel()
        totalView?.addSubview(lbl_popularFood)
        lbl_popularFood.translatesAutoresizingMaskIntoConstraints = false
        lbl_popularFood.leadingAnchor.constraint(equalTo:totalView!.leadingAnchor).isActive = true
        lbl_popularFood.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        lbl_popularFood.topAnchor.constraint(equalTo: collectionviewTop.bottomAnchor).isActive = true
        lbl_popularFood.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        lbl_popularFood.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lbl_popularFood.text = "Mon An Pho Bien"
        lbl_popularFood.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        lbl_popularFood.textAlignment = .center
        lbl_popularFood.backgroundColor = .lightGray
        
//        var collectionPopularFood: UICollectionView?
        totalView?.addSubview(collectionPopularFood)
        collectionPopularFood.translatesAutoresizingMaskIntoConstraints = false
        collectionPopularFood.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        collectionPopularFood.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        collectionPopularFood.topAnchor.constraint(equalTo: lbl_popularFood.bottomAnchor).isActive = true
        collectionPopularFood.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        collectionPopularFood.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 5).isActive = true
        let collectionViewFlowLayout1 = UICollectionViewFlowLayout()
        collectionPopularFood.setCollectionViewLayout(collectionViewFlowLayout1, animated: true)
        collectionViewFlowLayout1.scrollDirection = .horizontal
        collectionViewFlowLayout1.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout1.minimumInteritemSpacing = 0
        collectionViewFlowLayout1.minimumLineSpacing = 0
        
//        var lblQuestion: UILabel = UILabel()
        totalView?.addSubview(lblQuestion)
        lblQuestion.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        lblQuestion.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        lblQuestion.topAnchor.constraint(equalTo: collectionPopularFood.bottomAnchor).isActive = true
        lblQuestion.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        lblQuestion.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblQuestion.text = "Hom nay ban muon an gi ?"
        lblQuestion.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        lblQuestion.textAlignment = .center
        
//        var collectionChoose: UICollectionView?
        
        totalView?.addSubview(collectionChoose)
        collectionChoose.translatesAutoresizingMaskIntoConstraints = false
        collectionChoose.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        collectionChoose.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        collectionChoose.topAnchor.constraint(equalTo: totalView!.topAnchor).isActive = true
        collectionChoose.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        collectionChoose.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let collectionViewFlowLayout2 = UICollectionViewFlowLayout()
        collectionChoose.setCollectionViewLayout(collectionViewFlowLayout2, animated: true)
        collectionViewFlowLayout2.scrollDirection = .horizontal
        collectionViewFlowLayout2.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout2.minimumInteritemSpacing = 0
        collectionViewFlowLayout2.minimumLineSpacing = 0
        
//        var collectionRequest: UICollectionView?
        totalView?.addSubview(collectionRequest)
        collectionRequest.translatesAutoresizingMaskIntoConstraints = false
        collectionRequest.leadingAnchor.constraint(equalTo: totalView!.leadingAnchor).isActive = true
        collectionRequest.trailingAnchor.constraint(equalTo: totalView!.trailingAnchor).isActive = true
        collectionRequest.topAnchor.constraint(equalTo: collectionChoose.bottomAnchor).isActive = true
        collectionRequest.widthAnchor.constraint(equalTo: totalView!.widthAnchor).isActive = true
        let collectionViewFlowLayout3 = UICollectionViewFlowLayout()
        collectionRequest.setCollectionViewLayout(collectionViewFlowLayout3, animated: true)
        collectionViewFlowLayout3.scrollDirection = .horizontal
        collectionViewFlowLayout3.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout3.minimumInteritemSpacing = 0
        collectionViewFlowLayout3.minimumLineSpacing = 0
    }
}
