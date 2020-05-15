//
//  ViewController.swift
//  TestStoryboard
//
//  Created by Xuan Huy on 11/19/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myCollectionView: UICollectionView?
    @IBAction func btnBack(segue: UIStoryboardSegue)
    {
        
    }
    let CellID = "myCell"
    var character: [Characters] = characterData
//    var img: PHAsset = PHAsset()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        
    }
//    func getAssetThumbnail(asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        manager.requestImage(for: asset, targetSize: CGSize(width: 100.0, height: 100.0), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//                thumbnail = result!
//        })
//        return thumbnail
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! CharacterCollectionViewCell
        
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan: .orange
        cell.chars = character[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
       
        print("number of image: \(indexPath.item)")
//        print("chon anh \(imageSelect)")
        let nextItem: NSIndexPath = NSIndexPath(row: indexPath.item + 1, section: 0)
        let firstItem: NSIndexPath = NSIndexPath(row: 0, section: 0)
        
        if indexPath.item == character.count - 1
        {
             let imageSelect = character[firstItem.row]
            let vc = ImageViewController()
//                UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "imageView") as! ImageViewController
             
            vc.img = imageSelect
             print("vc : \(String(describing: vc.img))")
             
             self.navigationController?.pushViewController(vc, animated: true)
              
              print("push")
        }
        else
        {
             let imageSelect = character[nextItem.row]
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "imageView") as! ImageViewController
             
            vc.img = imageSelect
             print("vc : \(String(describing: vc.img))")
             
             self.navigationController?.pushViewController(vc, animated: true)
              
              print("push")
        }
          
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: 374, height: 450)
//        return CGSize(width: view.frame.size.width, height: view.frame.size.width)
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        let width = (UIScreen.main.bounds.size.width)
//
//        let height = (UIScreen.main.bounds.size.height)/2
//
//        return CGSize(width: width, height: height)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}

