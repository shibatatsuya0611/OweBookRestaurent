
//
//  profileController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class profileController: UIViewController, UINavigationBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    var collectionMenuProfile: [menuProfile] = menuProfileData
    var collmenu:[title] = titleData
    
    var scrollview: UIScrollView = UIScrollView()
    
    var totalView: UIView = UIView()
    
    var stackviewtop: UIView = UIView()
    var lblUserName: UILabel = UILabel()
    var lblMoney: UILabel = UILabel()
    var imageUser: UIImageView = UIImageView()
    
    var collectionButton: UICollectionView =
    {
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
               v.translatesAutoresizingMaskIntoConstraints = false
               
               return v
    }()
    
    var collectionMenu: UICollectionView =
    {
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    var stackviewHistory: UIView = UIView()
    var image_history: UIImageView = UIImageView()
    var lbl_history: UILabel = UILabel()
    
    var stackView_DanhGia: UIView = UIView()
    var lbl_danhgiacuatoi: UILabel = UILabel()
    var imageDanhgiaCuatoi: UIImageView = UIImageView()
    
    var stackView_NhaHangYeuThich: UIView = UIView()
    var imageNhaHangLike: UIImageView = UIImageView()
    var lbl_NhaHangLike: UILabel = UILabel()
    
    var stackViewDanhSachMaGiamGia: UIView = UIView()
    var imageMagiaGia: UIImageView = UIImageView()
    var lbl_MaGiamGia: UILabel = UILabel()
    
    var stackViewThanhToan: UIView = UIView()
    var imageViewThanhToan: UIImageView = UIImageView()
    var lbl_ThanhToan: UILabel = UILabel()
    
    var stackViewThemDiaChi: UIView = UIView()
    var imageViewThemDiaChi: UIImageView = UIImageView()
    var lbl_ThemDiaChi: UILabel = UILabel()
    
    var stackViewSetting: UIView = UIView()
    var imageSetting: UIImageView = UIImageView()
    var lbl_setting: UILabel = UILabel()
    
    var stackViewInfor: UIView = UIView()
    var imageInfor: UIImageView = UIImageView()
    var lbl_ingfor: UILabel = UILabel()
    
    var stackViewLogOut: UIView = UIView()
    var btn_LogOut: UIButton = UIButton()
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Ho So"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .white
        
        autolayoutUI()
        setUpHorizoltalBar()

        // Do any additional setup after loading the view.
        collectionMenu.delegate = self
        collectionMenu.dataSource = self
        collectionMenu.register(profileCollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        collectionButton.delegate = self
        collectionButton.dataSource = self
        collectionButton.register(menuProfileCell.self, forCellWithReuseIdentifier: "cellBtn")
        
//        collectionMenuBar.delegate = self
//        collectionMenuBar.dataSource = self
//        collectionMenuBar.register(menuBarCell.self, forCellWithReuseIdentifier: "cellBar")
    }
    var horizontalLeadingAnchor: NSLayoutConstraint?
    func setUpHorizoltalBar()
    {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .black
        collectionMenu.addSubview(horizontalBarView)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalLeadingAnchor = horizontalBarView.leadingAnchor.constraint(equalTo: collectionButton.leadingAnchor)
            
        horizontalLeadingAnchor?.isActive = true
        
//        horizontalBarView.bottomAnchor.constraint(equalTo: collectionButton.bottomAnchor, constant: 5).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: scrollview.widthAnchor, multiplier: 1 / 2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    func autolayoutUI()
    {
        
        // scroll view
        view.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollview.backgroundColor = .lightGray
        
        scrollview.addSubview(totalView)
        totalView.translatesAutoresizingMaskIntoConstraints = false
        totalView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        totalView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        totalView.topAnchor.constraint(equalTo: scrollview.topAnchor).isActive = true
        totalView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor).isActive = true
        totalView.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
        totalView.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1.5).isActive = true
        totalView.backgroundColor = .lightGray

        // stackview
        totalView.addSubview(stackviewtop)
        stackviewtop.translatesAutoresizingMaskIntoConstraints = false
        stackviewtop.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackviewtop.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackviewtop.topAnchor.constraint(equalTo: scrollview.topAnchor).isActive = true
        stackviewtop.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
        stackviewtop.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 10).isActive = true
        stackviewtop.backgroundColor = .darkGray
        
        //imageUser
        stackviewtop.addSubview(imageUser)
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.image = #imageLiteral(resourceName: "personfull")
        imageUser.leadingAnchor.constraint(equalTo: stackviewtop.leadingAnchor, constant: 10).isActive = true
        imageUser.topAnchor.constraint(equalTo: stackviewtop.topAnchor).isActive = true
        imageUser.centerYAnchor.constraint(equalTo: stackviewtop.centerYAnchor).isActive = true
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = self.imageUser.frame.width / 2
        imageUser.widthAnchor.constraint(equalTo: stackviewtop.widthAnchor, multiplier: 1 / 6).isActive = true
        imageUser.heightAnchor.constraint(equalTo: stackviewtop.heightAnchor).isActive = true
        imageUser.backgroundColor = .gray

//        var lblUser: UILabel = UILabel()
        stackviewtop.addSubview(lblUserName)
        lblUserName.translatesAutoresizingMaskIntoConstraints = false
        lblUserName.topAnchor.constraint(equalTo: stackviewtop.topAnchor, constant: 5).isActive = true
        lblUserName.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 20).isActive = true
//        lblUserName.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        lblUserName.widthAnchor.constraint(equalTo: stackviewtop.widthAnchor, multiplier: 1 / 3).isActive = true
        lblUserName.heightAnchor.constraint(equalTo: stackviewtop.heightAnchor, multiplier: 1 / 3).isActive = true
        lblUserName.text = "Shiba Tatsuya"
        lblUserName.font = UIFont.systemFont(ofSize: 15, weight: .bold)

        // lbl money
        stackviewtop.addSubview(lblMoney)
        lblMoney.translatesAutoresizingMaskIntoConstraints = false
        lblMoney.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 20).isActive = true
        lblMoney.topAnchor.constraint(equalTo: lblUserName.bottomAnchor, constant: 5).isActive = true
//        lblMoney.widthAnchor.constraint(equalTo: stackviewtop.widthAnchor, multiplier: 1 / 3).isActive = true
        lblMoney.heightAnchor.constraint(equalTo: stackviewtop.heightAnchor, multiplier: 1 / 3).isActive = true
        lblMoney.text = "⎗ 0d"
        lblMoney.font = UIFont.systemFont(ofSize: 12)
        
        
//        lbl_DonHang
        scrollview.addSubview(collectionButton)
        collectionButton.translatesAutoresizingMaskIntoConstraints = false
        collectionButton.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        collectionButton.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        collectionButton.topAnchor.constraint(equalTo: stackviewtop.bottomAnchor).isActive = true
        collectionButton.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
        collectionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        collectionButton.backgroundColor = .cyan
        
        let collectionViewFlowLayout1 = UICollectionViewFlowLayout()
        collectionButton.setCollectionViewLayout(collectionViewFlowLayout1, animated: true)
        collectionButton.isPagingEnabled = true
        collectionButton.setContentOffset(CGPoint.zero, animated: true)
        collectionViewFlowLayout1.scrollDirection = .horizontal
        collectionViewFlowLayout1.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout1.minimumInteritemSpacing = 0
        collectionViewFlowLayout1.minimumLineSpacing = 0
    
        
        // pageControl
//        scrollview.addSubview(pageControl)
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.topAnchor.constraint(equalTo: collectionButton.bottomAnchor, constant: -5).isActive = true
//        pageControl.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
//        pageControl.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
//        pageControl.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
//        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        //collectionView
        collectionMenu = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        scrollview.addSubview(collectionMenu)
        collectionMenu.translatesAutoresizingMaskIntoConstraints = false
        collectionMenu.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        collectionMenu.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        collectionMenu.topAnchor.constraint(equalTo: collectionButton.bottomAnchor).isActive = true
        collectionMenu.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
        collectionMenu.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 8).isActive = true
        collectionMenu.backgroundColor = .white
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionMenu.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionMenu.isPagingEnabled = true
        collectionMenu.setContentOffset(CGPoint.zero, animated: true)
        collectionMenu.showsHorizontalScrollIndicator = false
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        // stackview history
        totalView.addSubview(stackviewHistory)
        stackviewHistory.translatesAutoresizingMaskIntoConstraints = false
        stackviewHistory.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackviewHistory.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackviewHistory.topAnchor.constraint(equalTo: collectionMenu.bottomAnchor, constant:  10).isActive = true
        stackviewHistory.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackviewHistory.backgroundColor = .white
        
        //image history
        stackviewHistory.addSubview(image_history)
        image_history.image = #imageLiteral(resourceName: "history")
        image_history.layer.masksToBounds = true
        image_history.layer.cornerRadius = (self.image_history.frame.size.width) / 2
        image_history.translatesAutoresizingMaskIntoConstraints = false
        image_history.leadingAnchor.constraint(equalTo: stackviewHistory.leadingAnchor).isActive = true
        image_history.centerYAnchor.constraint(equalTo: stackviewHistory.centerYAnchor).isActive = true
        image_history.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image_history.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        //lbl history
        stackviewHistory.addSubview(lbl_history)
        lbl_history.translatesAutoresizingMaskIntoConstraints = false
        lbl_history.leadingAnchor.constraint(equalTo: image_history.trailingAnchor, constant: 10).isActive = true
        lbl_history.centerYAnchor.constraint(equalTo: stackviewHistory.centerYAnchor).isActive = true
        lbl_history.text = "Lich su don hang"
        lbl_history.font = UIFont.systemFont(ofSize: 10)
        
        //stackView danh gia cua toi
        totalView.addSubview(stackView_DanhGia)
        stackView_DanhGia.translatesAutoresizingMaskIntoConstraints = false
        stackView_DanhGia.leadingAnchor.constraint(equalTo: totalView.leadingAnchor).isActive = true
        stackView_DanhGia.trailingAnchor.constraint(equalTo: totalView.trailingAnchor).isActive = true
        stackView_DanhGia.topAnchor.constraint(equalTo: stackviewHistory.bottomAnchor, constant: 10).isActive = true
        stackView_DanhGia.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackView_DanhGia.backgroundColor = .white
        
        //imageView danh gia cua toi
        stackView_DanhGia.addSubview(imageDanhgiaCuatoi)
        imageDanhgiaCuatoi.image = #imageLiteral(resourceName: "handlike")
        imageDanhgiaCuatoi.layer.masksToBounds = true
        imageDanhgiaCuatoi.layer.cornerRadius = (self.imageDanhgiaCuatoi.frame.size.width) / 2
        imageDanhgiaCuatoi.translatesAutoresizingMaskIntoConstraints = false
        imageDanhgiaCuatoi.leadingAnchor.constraint(equalTo: stackView_DanhGia.leadingAnchor, constant: 10).isActive = true
        imageDanhgiaCuatoi.centerYAnchor.constraint(equalTo: stackView_DanhGia.centerYAnchor).isActive = true
        imageDanhgiaCuatoi.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageDanhgiaCuatoi.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //lbl danh gia cua toi
        stackView_DanhGia.addSubview(lbl_danhgiacuatoi)
        lbl_danhgiacuatoi.translatesAutoresizingMaskIntoConstraints = false
        lbl_danhgiacuatoi.leadingAnchor.constraint(equalTo: imageDanhgiaCuatoi.trailingAnchor).isActive = true
        lbl_danhgiacuatoi.centerYAnchor.constraint(equalTo: stackView_DanhGia.centerYAnchor).isActive = true
        lbl_danhgiacuatoi.text = "Danh gia cua toi"
        lbl_danhgiacuatoi.font = UIFont.systemFont(ofSize: 10)
        
//        var stackView_NhaHangYeuThich: UIStackView?
        totalView.addSubview(stackView_NhaHangYeuThich)
        stackView_NhaHangYeuThich.translatesAutoresizingMaskIntoConstraints = false
        stackView_NhaHangYeuThich.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackView_NhaHangYeuThich.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackView_NhaHangYeuThich.topAnchor.constraint(equalTo: stackView_DanhGia.bottomAnchor,constant: 1).isActive = true
        stackView_NhaHangYeuThich.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackView_NhaHangYeuThich.backgroundColor = .white
        
//        var imageNhaHangLike: UIImageView?
        stackView_NhaHangYeuThich.addSubview(imageNhaHangLike)
        imageNhaHangLike.image = #imageLiteral(resourceName: "heart")
        imageNhaHangLike.layer.masksToBounds = true
        imageNhaHangLike.layer.cornerRadius = (self.imageNhaHangLike.frame.size.width) / 2
        imageNhaHangLike.translatesAutoresizingMaskIntoConstraints = false
        imageNhaHangLike.leadingAnchor.constraint(equalTo: stackView_NhaHangYeuThich.leadingAnchor).isActive = true
        imageNhaHangLike.centerYAnchor.constraint(equalTo: stackView_NhaHangYeuThich.centerYAnchor).isActive = true
        imageNhaHangLike.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageNhaHangLike.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_NhaHangLike: UILabel = UILabel()
        stackView_NhaHangYeuThich.addSubview(lbl_NhaHangLike)
        lbl_NhaHangLike.translatesAutoresizingMaskIntoConstraints = false
        lbl_NhaHangLike.leadingAnchor.constraint(equalTo: imageNhaHangLike.trailingAnchor, constant: 10).isActive = true
        lbl_NhaHangLike.centerYAnchor.constraint(equalTo: stackView_NhaHangYeuThich.centerYAnchor).isActive = true
        lbl_NhaHangLike.text = "Nha hanh yeu thich"
        lbl_NhaHangLike.font = UIFont.systemFont(ofSize: 10)
        
//        var stackViewDanhSachMaGiamGia: UIStackView?
        totalView.addSubview(stackViewDanhSachMaGiamGia)
        stackViewDanhSachMaGiamGia.translatesAutoresizingMaskIntoConstraints = false
        stackViewDanhSachMaGiamGia.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewDanhSachMaGiamGia.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewDanhSachMaGiamGia.topAnchor.constraint(equalTo: stackView_NhaHangYeuThich.bottomAnchor, constant: 1).isActive
         = true
        stackViewDanhSachMaGiamGia.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackViewDanhSachMaGiamGia.backgroundColor = .white
        
//        var imageMagiaGia: UIImageView?
        stackViewDanhSachMaGiamGia.addSubview(imageMagiaGia)
        imageMagiaGia.image = #imageLiteral(resourceName: "tag")
        imageMagiaGia.layer.masksToBounds = true
        imageMagiaGia.layer.cornerRadius = (self.imageMagiaGia.frame.size.width) / 2
        imageMagiaGia.translatesAutoresizingMaskIntoConstraints = false
        imageMagiaGia.leadingAnchor.constraint(equalTo: stackViewDanhSachMaGiamGia.leadingAnchor).isActive = true
        imageMagiaGia.centerYAnchor.constraint(equalTo: stackViewDanhSachMaGiamGia.centerYAnchor).isActive = true
        imageMagiaGia.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageMagiaGia.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_MaGiamGia: UILabel = UILabel()
        stackViewDanhSachMaGiamGia.addSubview(lbl_MaGiamGia)
        lbl_MaGiamGia.translatesAutoresizingMaskIntoConstraints = false
        lbl_MaGiamGia.leadingAnchor.constraint(equalTo: imageMagiaGia.trailingAnchor, constant:  10).isActive = true
        lbl_MaGiamGia.centerYAnchor.constraint(equalTo: stackViewDanhSachMaGiamGia.centerYAnchor).isActive = true
        lbl_MaGiamGia.text = "Danh sach ma giam gia"
        lbl_MaGiamGia.font = UIFont.systemFont(ofSize: 10)
        
//        var stackViewThanhToan: UIStackView?
        totalView.addSubview(stackViewThanhToan)
        stackViewThanhToan.translatesAutoresizingMaskIntoConstraints = false
        stackViewThanhToan.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewThanhToan.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewThanhToan.topAnchor.constraint(equalTo: stackViewDanhSachMaGiamGia.bottomAnchor, constant: 1).isActive = true
        stackViewThanhToan.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackViewThanhToan.backgroundColor = .white
        
//        var imageViewThanhToan: UIImageView?
        stackViewThanhToan.addSubview(imageViewThanhToan)
        imageViewThanhToan.image = #imageLiteral(resourceName: "wallet")
        imageViewThanhToan.layer.masksToBounds = true
        imageViewThanhToan.layer.cornerRadius = (self.imageViewThanhToan.frame.size.width) / 2
        imageViewThanhToan.translatesAutoresizingMaskIntoConstraints = false
        imageViewThanhToan.leadingAnchor.constraint(equalTo: stackViewThanhToan.leadingAnchor).isActive = true
        imageViewThanhToan.centerYAnchor.constraint(equalTo: stackViewThanhToan.centerYAnchor).isActive = true
        imageViewThanhToan.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageViewThanhToan.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_ThanhToan: UILabel = UILabel()
        stackViewThanhToan.addSubview(lbl_ThanhToan)
        lbl_ThanhToan.translatesAutoresizingMaskIntoConstraints = false
        lbl_ThanhToan.leadingAnchor.constraint(equalTo: imageViewThanhToan.trailingAnchor, constant: 10).isActive = true
        lbl_ThanhToan.centerYAnchor.constraint(equalTo: stackViewThanhToan.centerYAnchor).isActive = true
        lbl_ThanhToan.text = "Thanh Toan"
        lbl_ThanhToan.font = UIFont.systemFont(ofSize: 10)
//
//        var stackViewThemDiaChi: UIStackView?
        totalView.addSubview(stackViewThemDiaChi)
        stackViewThemDiaChi.translatesAutoresizingMaskIntoConstraints = false
        stackViewThemDiaChi.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewThemDiaChi.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewThemDiaChi.topAnchor.constraint(equalTo: stackViewThanhToan.bottomAnchor, constant: 1).isActive = true
        stackViewThemDiaChi.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 13).isActive = true
        stackViewThemDiaChi.backgroundColor = .white
        
//        var imageViewThemDiaChi: UIImageView?
        stackViewThemDiaChi.addSubview(imageViewThemDiaChi)
        imageViewThemDiaChi.image = #imageLiteral(resourceName: "location")
        imageViewThemDiaChi.layer.masksToBounds = true
        imageViewThemDiaChi.layer.cornerRadius = (self.imageViewThemDiaChi.frame.size.width) / 2
        imageViewThemDiaChi.translatesAutoresizingMaskIntoConstraints = false
        imageViewThemDiaChi.leadingAnchor.constraint(equalTo: stackViewThemDiaChi.leadingAnchor).isActive = true
        imageViewThemDiaChi.centerYAnchor.constraint(equalTo: stackViewThemDiaChi.centerYAnchor).isActive = true
        imageViewThemDiaChi.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageViewThemDiaChi.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_ThemDiaChi: UILabel = UILabel()
        stackViewThemDiaChi.addSubview(lbl_ThemDiaChi)
        lbl_ThemDiaChi.translatesAutoresizingMaskIntoConstraints = false
        lbl_ThemDiaChi.leadingAnchor.constraint(equalTo: imageViewThemDiaChi.trailingAnchor, constant: 10).isActive = true
        lbl_ThemDiaChi.centerYAnchor.constraint(equalTo: stackViewThemDiaChi.centerYAnchor).isActive = true
        lbl_ThemDiaChi.text = "Them dia chi"
        lbl_ThemDiaChi.font = UIFont.systemFont(ofSize: 10)
        
//        var stackViewSetting: UIStackView?
        totalView.addSubview(stackViewSetting)
        stackViewSetting.translatesAutoresizingMaskIntoConstraints = false
        stackViewSetting.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewSetting.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewSetting.topAnchor.constraint(equalTo: stackViewThemDiaChi.bottomAnchor, constant: 1).isActive = true
        stackViewSetting.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive =  true
        
        stackViewSetting.backgroundColor = .white
        
//        var imageSetting: UIImageView?
        stackViewSetting.addSubview(imageSetting)
        imageSetting.image = #imageLiteral(resourceName: "setting")
        imageSetting.layer.masksToBounds = true
        imageSetting.layer.cornerRadius = (self.imageSetting.frame.size.width) / 2
        imageSetting.translatesAutoresizingMaskIntoConstraints = false
        imageSetting.leadingAnchor.constraint(equalTo: stackViewSetting.leadingAnchor).isActive = true
        imageSetting.centerYAnchor.constraint(equalTo: stackViewSetting.centerYAnchor).isActive = true
        imageSetting.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageSetting.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_setting: UILabel = UILabel()
        stackViewSetting.addSubview(lbl_setting)
        lbl_setting.translatesAutoresizingMaskIntoConstraints = false
        lbl_setting.leadingAnchor.constraint(equalTo: imageSetting.trailingAnchor, constant: 10).isActive = true
        lbl_setting.centerYAnchor.constraint(equalTo: stackViewSetting.centerYAnchor).isActive = true
        lbl_setting.text = "Cai dat"
        lbl_setting.font = UIFont.systemFont(ofSize: 10)
        
//        var stackViewInfor: UIStackView?
        totalView.addSubview(stackViewInfor)
        stackViewInfor.translatesAutoresizingMaskIntoConstraints = false
        stackViewInfor.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewInfor.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewInfor.topAnchor.constraint(equalTo: stackViewSetting.bottomAnchor, constant: 1).isActive = true
        stackViewInfor.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackViewInfor.backgroundColor = .white
        
//        var imageInfor: UIImageView?
        stackViewInfor.addSubview(imageInfor)
        imageInfor.image = #imageLiteral(resourceName: "infor")
        imageInfor.layer.masksToBounds = true
        imageInfor.layer.cornerRadius = (self.imageInfor.frame.size.width) / 2
        imageInfor.translatesAutoresizingMaskIntoConstraints = false
        imageInfor.leadingAnchor.constraint(equalTo: stackViewInfor.leadingAnchor).isActive = true
        imageInfor.centerYAnchor.constraint(equalTo: stackViewInfor.centerYAnchor).isActive = true
        imageInfor.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageInfor.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        var lbl_ingfor: UILabel = UILabel()
        stackViewInfor.addSubview(lbl_ingfor)
        lbl_ingfor.translatesAutoresizingMaskIntoConstraints = false
        lbl_ingfor.leadingAnchor.constraint(equalTo: imageInfor.trailingAnchor, constant: 10).isActive = true
        lbl_ingfor.centerYAnchor.constraint(equalTo: stackViewInfor.centerYAnchor).isActive = true
        lbl_ingfor.text = "infor"
        lbl_ingfor.font = UIFont.systemFont(ofSize: 10)

//        var stackViewLogOut: UIStackView?
        totalView.addSubview(stackViewLogOut)
        stackViewLogOut.translatesAutoresizingMaskIntoConstraints = false
        stackViewLogOut.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        stackViewLogOut.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        stackViewLogOut.topAnchor.constraint(equalTo: stackViewInfor.bottomAnchor, constant: 10).isActive = true
        stackViewLogOut.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1 / 13).isActive = true
        stackViewLogOut.backgroundColor = .white
        
//        var btn_LogOut: UIButton = UIButton()
        stackViewLogOut.addSubview(btn_LogOut)
       
        btn_LogOut.translatesAutoresizingMaskIntoConstraints = false
        btn_LogOut.centerYAnchor.constraint(equalTo: stackViewLogOut.centerYAnchor).isActive = true
        btn_LogOut.centerXAnchor.constraint(equalTo: stackViewLogOut.centerXAnchor).isActive = true
        btn_LogOut.setTitle("Log out", for: .normal)
        btn_LogOut.setTitleColor(.orange, for: .normal)
        btn_LogOut.addTarget(self, action: #selector(btnLogOutAction), for: .touchUpInside)
        
    }
    @objc func btnLogOutAction(sender: UIButton!)
    {
        print("Log out !")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if(collectionView == collectionButton)
        {
            return collmenu.count
        }
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(collectionView == collectionButton)
        {
            let cell = collectionButton.dequeueReusableCell(withReuseIdentifier: "cellBtn", for: indexPath) as! menuProfileCell
            cell.autolayoutBtn()
            cell.titles = collmenu[indexPath.row]
            cell.backgroundColor = .red
            return cell
        }
        let cell = collectionMenu.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! profileCollectionCell
//        cell.backgroundColor = .blue 
        cell.layoutCell()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if(collectionView == collectionButton)
        {
            let width = UIScreen.main.bounds.size.width / 2
//            let height = UIScreen.main.bounds.size.width / 14
            return CGSize(width: width, height: 30)
        }
        let width = (UIScreen.main.bounds.size.width)
        let height = UIScreen.main.bounds.size.height / 8
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
        if(collectionView == collectionButton)
        {
            print("chon \(indexPath.row)")
            let nextIndex = indexPath.row
            let indexPath = IndexPath(item: nextIndex, section: 0)

            collectionMenu.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            let x = CGFloat(indexPath.item) * UIScreen.main.bounds.size.width / 2
            
            horizontalLeadingAnchor?.constant = x
        
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                self.view.layoutIfNeeded()
            }, completion:  nil)
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        // vuot tay
        let x = targetContentOffset.pointee.x * 0.5
        print("x / scrollview.frame = \(x/scrollView.frame.width)")
        horizontalLeadingAnchor?.constant = x
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion:  nil)
    }
}
