//
//  profileCollectionCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/3/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class profileCollectionCell: UICollectionViewCell
{

    var viewchoxacnhan: UIView = UIView()
    var imageViewCell: UIImageView = UIImageView()
    var lbl_descip: UILabel = UILabel()
    
    var viewchothanhtoan: UIView = UIView()
    var imageChothanhtoan: UIImageView = UIImageView()
    var lblTitleChothanhtoan: UILabel = UILabel()
    
    var viewShipper: UIView = UIView()
    var imageShipper: UIImageView = UIImageView()
    var lblTitleShipper: UILabel = UILabel()
    
    var viewDanhgia: UIView = UIView()
    var imagDanhgia: UIImageView = UIImageView()
    var lblTitleDanhgia: UILabel = UILabel()
    
    func layoutCell()
    {
        addSubview(viewchoxacnhan)
        viewchoxacnhan.translatesAutoresizingMaskIntoConstraints = false
        viewchoxacnhan.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        viewchoxacnhan.topAnchor.constraint(equalTo: topAnchor).isActive = true

        viewchoxacnhan.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        viewchoxacnhan.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
        
        viewchoxacnhan.addSubview(imageViewCell)
        imageViewCell.image = #imageLiteral(resourceName: "letter")
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.widthAnchor.constraint(equalTo: viewchoxacnhan.widthAnchor).isActive = true
        imageViewCell.heightAnchor.constraint(equalTo: viewchoxacnhan.heightAnchor, multiplier: 1 / 2).isActive = true
        imageViewCell.centerXAnchor.constraint(equalTo: viewchoxacnhan.centerXAnchor).isActive = true
        imageViewCell.centerYAnchor.constraint(equalTo: viewchoxacnhan.centerYAnchor).isActive = true

        // lbl
        viewchoxacnhan.addSubview(lbl_descip)
        lbl_descip.translatesAutoresizingMaskIntoConstraints = false
        lbl_descip.topAnchor.constraint(equalTo: imageViewCell.bottomAnchor).isActive = true
        lbl_descip.centerXAnchor.constraint(equalTo: viewchoxacnhan.centerXAnchor).isActive = true
        lbl_descip.text = "Cho xac nhan"
        lbl_descip.font = UIFont.systemFont(ofSize: 10)
        
//        var viewchothanhtoan: UIView = UIView()
        addSubview(viewchothanhtoan)
        viewchothanhtoan.translatesAutoresizingMaskIntoConstraints = false
        viewchothanhtoan.leadingAnchor.constraint(equalTo: viewchoxacnhan.trailingAnchor, constant: 20).isActive = true
        viewchothanhtoan.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewchothanhtoan.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        viewchothanhtoan.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
//        var imageChothanhtoan: UIImageView = UIImageView()
        viewchothanhtoan.addSubview(imageChothanhtoan)
        imageChothanhtoan.translatesAutoresizingMaskIntoConstraints = false
        imageChothanhtoan.image = #imageLiteral(resourceName: "walletPay")
        imageChothanhtoan.widthAnchor.constraint(equalTo: viewchothanhtoan.widthAnchor).isActive = true
        imageChothanhtoan.centerXAnchor.constraint(equalTo: viewchothanhtoan.centerXAnchor).isActive = true
        imageChothanhtoan.centerYAnchor.constraint(equalTo: viewchothanhtoan.centerYAnchor).isActive = true
        imageChothanhtoan.heightAnchor.constraint(equalTo: viewchothanhtoan.heightAnchor, multiplier: 1 / 2).isActive = true
        
//        var lblTitleChothanhtoan: UILabel = UILabel()
        viewchothanhtoan.addSubview(lblTitleChothanhtoan)
        lblTitleChothanhtoan.translatesAutoresizingMaskIntoConstraints = false
        lblTitleChothanhtoan.topAnchor.constraint(equalTo: imageChothanhtoan.bottomAnchor).isActive = true
        lblTitleChothanhtoan.centerXAnchor.constraint(equalTo: viewchothanhtoan.centerXAnchor).isActive = true
        lblTitleChothanhtoan.text = "Cho thanh toan"
        lblTitleChothanhtoan.font = UIFont.systemFont(ofSize: 10)
        lblTitleChothanhtoan.textAlignment = .center
        
//        var viewShipper: UIView = UIView()
        addSubview(viewShipper)
        viewShipper.translatesAutoresizingMaskIntoConstraints = false
        viewShipper.leadingAnchor.constraint(equalTo: viewchothanhtoan.trailingAnchor, constant: 20).isActive = true
        viewShipper.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewShipper.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        viewShipper.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
//        var imageShipper: UIImageView = UIImageView()
        viewShipper.addSubview(imageShipper)
        imageShipper.translatesAutoresizingMaskIntoConstraints = false
        imageShipper.image = #imageLiteral(resourceName: "shipper")
        imageShipper.centerYAnchor.constraint(equalTo: viewShipper.centerYAnchor).isActive = true
        imageShipper.centerXAnchor.constraint(equalTo: viewShipper.centerXAnchor).isActive = true
        imageShipper.widthAnchor.constraint(equalTo: viewShipper.widthAnchor).isActive = true
        imageShipper.heightAnchor.constraint(equalTo: viewShipper.heightAnchor, multiplier: 1 / 2).isActive = true
        
//        var lblTitleShipper: UILabel = UILabel()
        viewShipper.addSubview(lblTitleShipper)
        lblTitleShipper.translatesAutoresizingMaskIntoConstraints = false
        lblTitleShipper.topAnchor.constraint(equalTo: imageShipper.bottomAnchor).isActive = true
        lblTitleShipper.centerXAnchor.constraint(equalTo: viewShipper.centerXAnchor).isActive = true
        lblTitleShipper.text = "Dang giao"
        lblTitleShipper.font = UIFont.systemFont(ofSize: 10)
        lblTitleShipper.textAlignment = .center
        
//        var viewDanhgia: UIView = UIView()
        addSubview(viewDanhgia)
        viewDanhgia.translatesAutoresizingMaskIntoConstraints = false
        viewDanhgia.leadingAnchor.constraint(equalTo: viewShipper.trailingAnchor, constant: 20).isActive = true
        viewDanhgia.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewDanhgia.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        viewDanhgia.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
//        var imagDanhgia: UIImageView = UIImageView()
        viewDanhgia.addSubview(imagDanhgia)
        imagDanhgia.translatesAutoresizingMaskIntoConstraints = false
        imagDanhgia.image = #imageLiteral(resourceName: "review")
        imagDanhgia.centerXAnchor.constraint(equalTo: viewDanhgia.centerXAnchor).isActive = true
        imagDanhgia.centerYAnchor.constraint(equalTo: viewDanhgia.centerYAnchor).isActive = true
        imagDanhgia.widthAnchor.constraint(equalTo: viewDanhgia.widthAnchor).isActive = true
        imagDanhgia.heightAnchor.constraint(equalTo: viewDanhgia.heightAnchor, multiplier: 1 / 2).isActive = true
        
//        var lblTitleDanhgia: UILabel = UILabel()
        viewDanhgia.addSubview(lblTitleDanhgia)
        lblTitleDanhgia.translatesAutoresizingMaskIntoConstraints = false
        lblTitleDanhgia.topAnchor.constraint(equalTo: imagDanhgia.bottomAnchor).isActive = true
        lblTitleDanhgia.centerXAnchor.constraint(equalTo: viewDanhgia.centerXAnchor).isActive = true
        lblTitleDanhgia.text = "Danh gia"
        lblTitleDanhgia.font = UIFont.systemFont(ofSize: 10)
        lblTitleDanhgia.textAlignment = .center
    }
    var menuProfiles: menuProfile!
    {
        didSet
        {
            imageViewCell.image = UIImage(named: menuProfiles.imageName!)
            lbl_descip.text = menuProfiles.title!
        }
    }
}
