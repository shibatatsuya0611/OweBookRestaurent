//
//  FoodViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/9/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UINavigationBarDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0,y: 0,width: 300,height: 20))
    var totalView: UIView?
    var scrollView: UIScrollView = UIScrollView()
    var lbl_GoiY: UILabel = UILabel()
    var collectionviewTop: UICollectionView = UICollectionView()
    var lbl_popularFood: UILabel = UILabel()
    var collectionPopularFood: UICollectionView = UICollectionView()
    var lblQuestion: UILabel = UILabel()
    var collectionChoose: UICollectionView = UICollectionView()
    var collectionRequest: UICollectionView = UICollectionView()
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        searchBarItem()
        autolayoutUI()
        
        // Do any additional setup after loading the view.
        collectionviewTop.delegate = self
        collectionviewTop.dataSource = self
        collectionviewTop.register(OneViewCell.self, forCellWithReuseIdentifier: "cellOne")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as! OneViewCell
        cell.backgroundColor = .cyan
        return cell
    }
}
