//
//  ReViewCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit
protocol ReViewCellDelegate: class {
    func clickToMore()
}
class ReViewCell: UICollectionViewCell
{
    weak var delegate: ReViewCellDelegate?
    
    var imageUser: UIImageView = UIImageView()
    var lbl_User: UILabel = UILabel()
    var lbl_Adrees: UILabel = UILabel()
    var btn_more: UIButton = UIButton()
    var lbl_rate: UILabel = UILabel()
    var lbl_time: UILabel = UILabel()
    var lbl_text: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    var lbl_fell: UILabel = UILabel()
    var btn_like: UIButton = UIButton()
    var btn_comment: UIButton = UIButton()
    var btn_share: UIButton = UIButton()
    var lbl_emptyBot: UILabel = UILabel()
    var arlet_btn_More: UIAlertController?
    
    func autolayoutCellUI()
    {
        //UI ImageUser
        addSubview(imageUser)
        imageUser.image = #imageLiteral(resourceName: "personfull")
        imageUser.backgroundColor = .lightGray
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageUser.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageUser.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageUser.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageUser.layer.masksToBounds = true
        imageUser.layer.cornerRadius = self.imageUser.frame.size.width / 2
        
        // UI User
        contentView.addSubview(lbl_User)
        lbl_User.text = "Trịnh Ngọc Ninh dang cam thay oi doi oi"
//        lbl_User.backgroundColor = .white
        lbl_User.font = UIFont.systemFont(ofSize: 14)
        lbl_User.translatesAutoresizingMaskIntoConstraints = false
        lbl_User.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 5).isActive = true
        lbl_User.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl_User.widthAnchor.constraint(equalToConstant: 220).isActive = true
        lbl_User.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // UI MoreButon
        addSubview(btn_more)
//        btn_more.backgroundColor = .white
        btn_more.setTitle("...", for: .normal)
        btn_more.setTitleColor(.blue, for: .normal)
        btn_more.addTarget(self, action: #selector(btnMoreAtion), for: .touchUpInside)
        btn_more.translatesAutoresizingMaskIntoConstraints = false
        btn_more.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        btn_more.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btn_more.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // UI lbl Adress
        addSubview(lbl_Adrees)
        lbl_Adrees.text = "adrees"
        lbl_Adrees.font = UIFont.systemFont(ofSize: 12)
        lbl_Adrees.translatesAutoresizingMaskIntoConstraints = false
        lbl_Adrees.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 10).isActive = true
        lbl_Adrees.topAnchor.constraint(equalTo: lbl_User.bottomAnchor, constant: 5).isActive = true
        lbl_Adrees.widthAnchor.constraint(equalTo: lbl_User.widthAnchor).isActive = true
        
        // UI lbl Rate
        addSubview(lbl_rate)
        lbl_rate.text = "★★★★★"
        lbl_rate.font = UIFont.systemFont(ofSize: 15)
        lbl_rate.textColor = .orange
        lbl_rate.translatesAutoresizingMaskIntoConstraints = false
        lbl_rate.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_rate.topAnchor.constraint(equalTo: btn_more.bottomAnchor, constant: 5).isActive = true
        
        // UI lbl Time
        addSubview(lbl_time)
        lbl_time.text = "⌚︎ 1 gio truoc"
        lbl_time.font = UIFont.systemFont(ofSize: 10)
        lbl_time.translatesAutoresizingMaskIntoConstraints = false
        lbl_time.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_time.topAnchor.constraint(equalTo: lbl_rate.bottomAnchor).isActive = true
        
//        var lbl_text: UILabel?
        addSubview(lbl_text)
        lbl_text.text = "ui troi oi"
        lbl_text.translatesAutoresizingMaskIntoConstraints = false
        lbl_text.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lbl_text.topAnchor.constraint(equalTo: imageUser.bottomAnchor).isActive = true
        
//        var imageView: UIImageView?
        addSubview(imageView)
//        imageView.backgroundColor = .white
        imageView.image = #imageLiteral(resourceName: "tohka1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: lbl_text.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1 / 1.7).isActive = true
        
//        var lbl_fell: UILabel?
        addSubview(lbl_fell)
        lbl_fell.text = "cam thay good"
        lbl_fell.translatesAutoresizingMaskIntoConstraints = false
        lbl_fell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lbl_fell.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        // lbl_emtyBot
        addSubview(lbl_emptyBot)
        lbl_emptyBot.backgroundColor = .lightGray
        lbl_emptyBot.translatesAutoresizingMaskIntoConstraints = false
        lbl_emptyBot.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lbl_emptyBot.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbl_emptyBot.topAnchor.constraint(equalTo: lbl_fell.bottomAnchor).isActive = true
        lbl_emptyBot.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lbl_emptyBot.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lbl_emptyBot.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
//        btn_like: UIButton = UIButton()
        addSubview(btn_like)
//        btn_like.backgroundColor = .white
        btn_like.setTitle("♡", for: .normal)
        btn_like.setTitleColor(.systemPink, for: .normal)
        btn_like.addTarget(self, action: #selector(btnLikeAtion), for: .touchUpInside)
        btn_like.translatesAutoresizingMaskIntoConstraints = false
        btn_like.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        btn_like.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        var btn_comment: UIButton = UIButton()
        addSubview(btn_comment)
        btn_comment.setTitle("☁︎ Bình luận", for: .normal)
        btn_comment.setTitleColor(.black, for: .normal)
        btn_comment.addTarget(self, action: #selector(btnCommentAtion), for: .touchUpInside)
        btn_comment.translatesAutoresizingMaskIntoConstraints = false
        btn_comment.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btn_comment.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        var btn_share: UIButton = UIButton()
        addSubview(btn_share)
        btn_share.setTitle("☞ Chia sẻ", for: .normal)
        btn_share.setTitleColor(.black, for: .normal)
        btn_share.addTarget(self, action: #selector(btnShareAtion), for: .touchUpInside)
        btn_share.translatesAutoresizingMaskIntoConstraints = false
        btn_share.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        btn_share.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
    @objc func btnMoreAtion(sender: UIButton!)
    {
        self.delegate?.clickToMore()
        print("Button Tap More")
//        arlet_btn_More = UIAlertController(title: "Arlet", message: "Are you sure", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(action) in
//            print("Press Cancel")
//        }
//        let okAction = UIAlertAction(title: "OK", style: .default) {(action) in
//            print("Press OK")
//        }
//        arlet_btn_More?.addAction(cancelAction)
//        arlet_btn_More?.addAction(okAction)    
    }
    
    @objc func btnLikeAtion(sender: UIButton!)
    {
        print("Button Tap Like")
    }
    
    @objc func btnCommentAtion(sender: UIButton!)
    {
        print("Button Tap Comment")
    }
    
    @objc func btnShareAtion(sender: UIButton!)
    {
        print("Button Tap Share")
    }
}
