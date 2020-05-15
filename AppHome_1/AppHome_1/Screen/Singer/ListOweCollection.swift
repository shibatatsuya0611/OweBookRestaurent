//
//  ListOweCollection.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/27/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

class ListOweCollectionView: UICollectionView
{
    let cellID = "idCollection"
//    var data: [Khach] = []
    var data: [[String: AnyObject]] = [[:]]
    var total: Int = 0
    {
        didSet
        {
            print("total set: \(total)")
            let vc = TransactionsViewController()
            vc.totalMonney = self.total
        }
    }
    var isSetHidden = false
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        allowsMultipleSelection = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        keyboardDismissMode = .onDrag
        
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView()
    {
        self.fillSuperview()
        
        //collectionView settings
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        
        self.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        self.setContentOffset(CGPoint.zero, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionViewFlowLayout.minimumInteritemSpacing = 10
         
         
        self.delegate = self
        self.dataSource = self
        self.register(ListOweCollectionCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListOweCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ListOweCollectionCell
        
        cell.numberDot.text = "\(indexPath.row + 1)"
        cell.data = data[indexPath.row]
//        cell.lblMonney.text = "\(data[indexPath.item]["totalowe"] as? String ?? "0")"
        print("datacustomer: =  \(data[indexPath.row])")
        let row = data[indexPath.row]
        self.total += Int(row["totalowe"] as? String ?? "0") ?? 0
        print("total: \(total)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = self.frame.width
        
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let row = data[indexPath.row]
        let vc = InforOweController()
        vc.title = "Chi tiết khách hàng"
        vc.data = row
        if isSetHidden == true
        {
            vc.isCheckInfor = true
        }
        else
        {
            vc.isCheckInfor = false
        }
        self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
//        if data.contains(where: {$0.name == "foo"}) {
//           // it exists, do something
//        } else {
//           //item could not be found
//        }
    }
    
    
}
