//
//  ReViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ReViewController: UIViewController, UINavigationBarDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ReViewCellDelegate, UINavigationControllerDelegate
{
    var arlet_btn_More: UIAlertController?
    
    func clickToMore() {
        print("helooo ")
        arlet_btn_More = UIAlertController(title: "Thong bao", message: "", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(action) in
            print("Press Cancel")
        }
        let reportPost = UIAlertAction(title: "Bao Cao bai viet", style: .default) {(action) in
            print("Press bao cao post")
        }
        let reportUser = UIAlertAction(title: "Bao cao User", style: .default) {(action) in
            print("bao cao user")
        }
        
        arlet_btn_More?.addAction(cancelAction)
        arlet_btn_More?.addAction(reportPost)
        arlet_btn_More?.addAction(reportUser)
        self.present(arlet_btn_More!, animated: true)
    }
    
    
    var collectionView: UICollectionView?
    var lbl_show: UILabel = UILabel()
    
    let cellSpacing: CGFloat = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = " Bai Viet"
        autolayoutUI()
        
        // Do any additional setup after loading the view.
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(ReViewCell.self, forCellWithReuseIdentifier: "ReView")
    }
    

    fileprivate func autolayoutUI()
    {
       
        
        // colection review
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -2).isActive = true
//        collectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        collectionView?.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -4).isActive = true
        collectionView?.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        collectionView?.backgroundColor = .white
                 //collectionview setting
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        
        // navigationbar
//        navigationItem.title = "Bai Viet"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
//        navigationController?.navigationBar.tintColor = .orange
//        navigationController?.navigationBar.barTintColor = .orange
        
         // lbl_show text
          view.addSubview(lbl_show)
          lbl_show.translatesAutoresizingMaskIntoConstraints = false
          lbl_show.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          lbl_show.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
          lbl_show.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
          lbl_show.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
          lbl_show.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 29).isActive = true
          lbl_show.text = ""
          lbl_show.textColor = .white
         //lbl_show.font = UIFont.systemFont(ofSize: 20, weight: .bold)
          lbl_show.backgroundColor = .orange
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReView", for: indexPath) as! ReViewCell
        cell.delegate = self
//        cell.backgroundColor = indexPath.item % 2 == 0 ?.red : .green
        cell.autolayoutCellUI()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.size.width) - 4
        let height = (UIScreen.main.bounds.size.height) / 2.2
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select \(indexPath.item)")
        navigationItem.title = " vua chon \(indexPath.row)"
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {

         if(velocity.y > 0)
         {

            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions(), animations: {
                 self.navigationController?.setNavigationBarHidden(true, animated: true)
               
             }, completion: nil)

         }
         else
         {
            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions(), animations: {
                 self.navigationController?.setNavigationBarHidden(false, animated: true)
                 
             }, completion: nil)
        }
    }
}
