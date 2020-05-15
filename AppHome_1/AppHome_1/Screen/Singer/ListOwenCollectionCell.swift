//
//  ListOwenCollectionCell.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/27/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

class ListOweCollectionCell: baseCell
{
    let numberDotView: UIView =
    {
        let n = UIView()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.backgroundColor = colorebtnAdd
        n.contentMode = .scaleAspectFill
        n.clipsToBounds = true
        n.layer.cornerRadius = 15
        
        return n
    }()
    
    let numberDot: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblCustomeNameTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tên Khách :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblCustomerName: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nguyen Van A"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhoneTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "SĐT :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhone: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "07428123214"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonneyTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Số tiền :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonney: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "9000000"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    var strPhoneNumBerPerSon: String = ""
    
    override func setupView()
    {
        super.setupView()
        
        makeBottomShadow(shadowOpacity: 1.0, shadowRadius: 1.0, radius: 5.0)
        backgroundColor = .white
        
        setupUI()
        
    }
    
    func setupUI()
    {
        addSubview(numberDotView)
        numberDotView.addSubview(numberDot)
        addSubview(lblCustomeNameTitle)
        addSubview(lblCustomerName)
        addSubview(lblPhoneTitle)
        addSubview(lblPhone)
        addSubview(lblMonneyTitle)
        addSubview(lblMonney)
        
        numberDotView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: 30, height: 30))
        numberDot.centerXAnchor.constraint(equalTo: numberDotView.centerXAnchor).isActive = true
        numberDot.centerYAnchor.constraint(equalTo: numberDotView.centerYAnchor).isActive = true
        
        // ...........
        
        lblCustomeNameTitle.anchor(top: topAnchor, leading: numberDotView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: 100, height: 0))
        lblCustomerName.anchor(top: topAnchor, leading: lblCustomeNameTitle.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblCustomerName.centerYAnchor.constraint(equalTo: lblCustomeNameTitle.centerYAnchor).isActive = true
        
        //............
        
        lblPhoneTitle.anchor(top: lblCustomeNameTitle.bottomAnchor, leading: lblCustomeNameTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .zero)
        lblPhone.anchor(top: lblCustomerName.bottomAnchor, leading: lblCustomerName.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblPhone.centerYAnchor.constraint(equalTo: lblPhoneTitle.centerYAnchor).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openPhonePerSon(_:)))
        lblPhone.isUserInteractionEnabled = true
        lblPhone.addGestureRecognizer(gesture)
        
        //..................
        
        lblMonneyTitle.anchor(top: lblPhoneTitle.bottomAnchor, leading: lblPhoneTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .zero)
        lblMonney.anchor(top: lblPhone.bottomAnchor, leading: lblPhone.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblMonney.centerYAnchor.constraint(equalTo: lblMonneyTitle.centerYAnchor).isActive = true
    }
    
    @objc func openPhonePerSon(_ : UITapGestureRecognizer)
    {
        print("call Phone")
        //        UIApplication.sharedApplication().openURL(NSURL(string: "tel://1234567890"))
        UIApplication.shared.openURL(URL(string: "tel://\(String(describing: strPhoneNumBerPerSon))")!)
        print("strphone = \(strPhoneNumBerPerSon)")
    }
    
//    var data: Khach!
//    {
//        didSet
//        {
//            print("data : \(String(describing: data))")
////            self.lblCustomerName.text
//            self.lblCustomerName.text = data.name
//            self.lblPhone.text = data.phone
//            self.lblMonney.text = "\(data.oweMonney)"
//            self.strPhoneNumBerPerSon = lblPhone.text!
//        }
//    }
    var data: [String: AnyObject]!
    {
        didSet
        {
//            cell.lblPetAge.text = "\(data![indexPath.item]["age"] as? String ?? "0")"
            self.lblCustomerName.text = data!["name"] as? String
            self.lblPhone.text = data!["phone"] as? String
            self.lblMonney.text = "\(data!["totalowe"] as? String ?? "0")"
            self.strPhoneNumBerPerSon = data!["phone"] as? String ?? "*101#"
        }
    }
}
