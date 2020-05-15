//
//  MainViewController.swift
//  Kiemtra_1
//
//  Created by Xuan Huy on 11/15/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit
import Photos

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
       
    var imageArray = [UIImage]()
    var collectionView: UICollectionView?
    var collectionviewTop: UICollectionView?
    var collectionviewBot: UICollectionView?
    let cellID = "CellID"
    let cellIDtop = "cellIDtop"
    let cellIDbot = "cellBot"
    let cellSpacing: CGFloat = 0
    //read Data
    var characters: [Character] = charactersData
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        autolayoutUI()
        
        collectionviewTop?.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: cellIDtop)
        collectionView?.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionviewBot?.register(BotCollectionViewCell.self, forCellWithReuseIdentifier: cellIDbot)
        
        collectionviewTop?.isPagingEnabled = true
        collectionviewTop?.delegate = self
        collectionviewTop?.dataSource = self
        
        collectionView?.isPagingEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionviewBot?.isPagingEnabled = true
        collectionviewBot?.delegate = self
        collectionviewBot?.dataSource = self
        // Do any additional setup after loading the view.
        
        grabPhotos()
    }
    
    fileprivate func autolayoutUI()
    {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

         collectionView?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3).isActive = true
         collectionView?.backgroundColor = .white
         //collectionview setting
         let collectionViewFlowLayout = UICollectionViewFlowLayout()
         collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
         collectionViewFlowLayout.scrollDirection = .vertical
         collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
         collectionViewFlowLayout.minimumInteritemSpacing = 0
         collectionViewFlowLayout.minimumLineSpacing = 0



         // collectionView Top

        collectionviewTop = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionviewTop!)
        collectionviewTop?.translatesAutoresizingMaskIntoConstraints = false
        collectionviewTop?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionviewTop?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionviewTop?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionviewTop?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3).isActive = true
        collectionviewTop?.backgroundColor = .white
        let collectionViewFlowLayout1 = UICollectionViewFlowLayout()
        collectionviewTop?.setCollectionViewLayout(collectionViewFlowLayout1, animated: true)
         collectionViewFlowLayout1.scrollDirection = .horizontal

         collectionViewFlowLayout1.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
         collectionViewFlowLayout1.minimumLineSpacing = 0
         collectionViewFlowLayout1.minimumInteritemSpacing = 0
         
        
         
         //collectionBot
        collectionviewBot = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

        view.addSubview(collectionviewBot!)

        collectionviewBot?.translatesAutoresizingMaskIntoConstraints = false
        collectionviewBot?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionviewBot?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionviewBot?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionviewBot?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3).isActive = true

        collectionviewBot?.backgroundColor = .white
        let collectionViewFlowLayout2 = UICollectionViewFlowLayout()
        collectionviewBot?.setCollectionViewLayout(collectionViewFlowLayout2, animated: true)
        collectionViewFlowLayout2.scrollDirection = .horizontal
        collectionViewFlowLayout2.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout2.minimumLineSpacing = 0
        collectionViewFlowLayout2.minimumInteritemSpacing = 0
              
    }
    func grabPhotos()
    {
        let imgManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOption)
        {
            if fetchResult.count > 0
            {
                for i in 0..<fetchResult.count
                {
                    imgManager.requestImage(for: fetchResult.object(at: i) , targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOptions, resultHandler: {
                        image, error in
                        self.imageArray.append(image!)
                    })
                }
            }
            else
            {
                print("Ban khong co anh !")
                self.collectionView?.reloadData()
                self.collectionviewTop?.reloadData()
                self.collectionviewBot?.reloadData()
            }
        }
    }
    
    
    // uicollectionViewDataSource  set up for cell
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
       {
          if (collectionView == collectionviewTop)
          {
              print("numberOfItemsInSection collectionviewTop")
              return imageArray.count > 0 ? imageArray.count : 10
          }
          if(collectionView == collectionviewBot)
          {
              print("collectionView Bot num berof section")
              return imageArray.count > 0 ? imageArray.count : 10
          }
          return imageArray.count > 0 ? imageArray.count: 10
      }
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
      {
         
          if (collectionView == collectionviewTop)
          {
              let cell2 = collectionviewTop?.dequeueReusableCell(withReuseIdentifier: cellIDtop, for: indexPath) as! TopCollectionViewCell
              cell2.backgroundColor = .cyan
              cell2.autolayoutCell()
              cell2.imageView.image = imageArray[indexPath.item]
  //            cell2.char = characters[indexPath.item]
              return cell2
          }
          else if (collectionView == collectionviewBot)
          {
              let cellBot = collectionviewBot?.dequeueReusableCell(withReuseIdentifier: cellIDbot, for: indexPath) as! BotCollectionViewCell
              
              cellBot.backgroundColor = .blue
              cellBot.autolayoutCell()
              cellBot.imageView.image = imageArray[indexPath.row]
  //            cellBot.char = characters[indexPath.row]
              return cellBot
          }
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CharacterCollectionCell

                     cell.backgroundColor = .red
                     cell.autolayoutCell()
                     cell.imageView.image = imageArray[indexPath.row]
          return cell

      }
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
      {
          print("chon anh \(indexPath.item)")
          let nextItem: NSIndexPath = NSIndexPath(row: indexPath.item + 1, section: 0)
          let firstItem: NSIndexPath = NSIndexPath(row: 0, section: 0)

          if indexPath.item == imageArray.count - 1
          {
  //            let iamgeSelect = characters[firstItem.row]
              let iamgeSelect = imageArray[firstItem.row]
              print("select \(iamgeSelect)")
              let vc = ImageViewController()
                  vc.img = iamgeSelect
              self.navigationController?.pushViewController(vc, animated: true)
          }
          else
          {
  //        let iamgeSelect = characters[nextItem.row]
              let iamgeSelect = imageArray[nextItem.row]
              print("select \(iamgeSelect)")
              let vc = ImageViewController()
                  vc.img = iamgeSelect
            self.navigationController?.pushViewController(vc, animated: true)
          }
      }
  //
  //    // uicolecctionviewDelegateflowlayout
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
      {
          //return CGSize(width: 100, height: 100)
          let width = (UIScreen.main.bounds.size.width)
          let height = (UIScreen.main.bounds.size.height) / 3
          return CGSize(width: width, height: height)
      }
}

