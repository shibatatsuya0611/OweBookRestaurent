//
//  HomeCollectionViewCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/26/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class HomeCollectionView: UICollectionView
{
    let cellID = "cellCollection"
    var arrHome = HomePageArr
    
    var data: [Khach] = []
    
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
        
//        data = khachData.getkhachList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        self.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
}


//MARK: EXTENSION HOME
extension HomeCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrHome.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomeCollectionViewCell
        cell.homarr = arrHome[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = self.frame.width / 2.3
        let height: CGFloat = self.frame.height / 2.3
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let vc = AddNewOweController()
            vc.title = "Thêm Nợ Mới"
            self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.item == 1 {
            let vc = Add_MinusController()
//            vc.data = khachData.getkhachList()
            vc.isCheck = 1
            vc.title = "Thay đổi nợ"
            self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.item == 2 {
            let vc = ListOweViewController()
            self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.item == 3
        {
            let vc = Add_MinusController()
            vc.isCheck = 0
            vc.title = "Tìm kiếm"
            self.parentViewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}















//MARK: HOME CELL

class HomeCollectionViewCell: baseCell
{
    let imgfunc: UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "avatar_booking_default")
//        img.backgroundColor = mainColor
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        
        return img
    }()
    
    let title: UILabel =
    {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Chuc nang 1"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        lbl.textColor = UIColor(hex: "333333")
        return lbl
    }()
    
    override func setupView()
    {
        super.setupView()
//        backgroundColor = .red
        setupUI()
    }
    
    func setupUI()
    {
        addSubview(imgfunc)
        addSubview(title)
        
        imgfunc.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgfunc.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgfunc.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgfunc.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        title.anchor(top: imgfunc.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .zero)
    }
    var homarr: HomeArr!
    {
        didSet
        {
            imgfunc.image = homarr?.image
            title.text = homarr?.title ?? "Chưa có chức năng"
        }
    }
}
