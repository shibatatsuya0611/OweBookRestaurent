//
//  notificationTableCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class notificationTableCell: UITableViewCell {

    var imageViewCell: UIImageView = UIImageView()
    var lbl_thongbao: UILabel = UILabel()
    var lbl_description: UILabel = UILabel()
    var lbl_time: UILabel = UILabel()

    func autolayoutUICell()
    {
        // image
        addSubview(imageViewCell)
        imageViewCell.image = #imageLiteral(resourceName: "tohka2")
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageViewCell.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageViewCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        imageViewCell.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 5).isActive = true
        
        // lbl_thongbao
        addSubview(lbl_thongbao)
        lbl_thongbao.translatesAutoresizingMaskIntoConstraints = false
        lbl_thongbao.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10).isActive = true
        lbl_thongbao.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_thongbao.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl_thongbao.text = "Khong nhan ban"
        lbl_thongbao.textColor = .red
        lbl_thongbao.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
//        var lbl_description: UILabel?
        addSubview(lbl_description)
        lbl_description.translatesAutoresizingMaskIntoConstraints = false
        lbl_description.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10).isActive = true
        lbl_description.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_description.topAnchor.constraint(equalTo: lbl_thongbao.bottomAnchor, constant: 2).isActive = true
        lbl_description.text = "Dat ban Tai N.A.T Quan - Am Thuc Dong Que that bai, qua thoi gian 60p chua nhan ban"
        lbl_description.font = UIFont.systemFont(ofSize: 10)
        
//        var lbl_time: UILabel?
        addSubview(lbl_time)
        lbl_time.translatesAutoresizingMaskIntoConstraints = false
        lbl_time.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10).isActive = true
        lbl_time.topAnchor.constraint(equalTo: lbl_description.bottomAnchor).isActive = true
        lbl_time.text = "16/11/2019    16:30"
        lbl_time.font = UIFont.systemFont(ofSize: 10)
    }
}
