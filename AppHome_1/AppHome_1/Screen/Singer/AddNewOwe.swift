//
//  AddNewOwe.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/26/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import  UIKit

protocol checkTextField: class
{
    func checkTextField(name: String, address: String, phone: String, note: String, owe: String, date: String)
}

class AddNewOwe: UIView, PHCurrencyFieldDelegate
{
    weak var delegate: checkTextField?
    
    let lblCustomerNameTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tên Khách"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblCustomerName: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập tên khách"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblAddressTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Địa chỉ"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblAddress: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập địa chỉ"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhoneTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "SĐT"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhone: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập Số điện thoại"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        lbl.keyboardType = UIKeyboardType.numberPad
        
        return lbl
    }()
    
    let lblNoteTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Ghi chú"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblNote: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập ghi chú"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonneyTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Số tiền"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonney: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập số tiền"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        lbl.keyboardType = UIKeyboardType.numberPad
        lbl.autocorrectionType = .no
        lbl.returnKeyType = .search
        
        return lbl
    }()
    
    let lblDateTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Ngày nợ"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblDate: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập ngày nợ"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    var data: [String: AnyObject]!
    {
        didSet
        {
            if self.isChecked == 0
            {
                lblCustomerName.text = data["name"] as? String
                lblAddress.text = data["address"] as? String
                lblPhone.text = data["phone"] as? String
                lblNote.text = data["note"] as? String
                lblMonney.text = "\(data["totalowe"] as? String ?? "0")đ"
                if let time = data["date"] as? String
                {
                    let timeToDoulble = Double(time)
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm '-' dd/MM/yyyy"
                    formatter.locale = Locale.current
                    let date = Date.init(timeIntervalSince1970: timeToDoulble!)
                    lblDate.text = formatter.string(from: date)
                }
            }
            else if self.isChecked == 3
            {
                lblCustomerName.text = data["name"] as? String
                lblAddress.text = data["address"] as? String
                lblPhone.text = data["phone"] as? String
                lblNote.text = data["note"] as? String
                lblMonney.text = "\(data["totalowe"] as? String ?? "0")đ"
//                lblDate.text = data["date"] as? String
                if let time = data["date"] as? String
                {
                    let timeToDoulble = Double(time)
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm '-' dd/MM/yyyy"
                    formatter.locale = Locale.current
                    let date = Date.init(timeIntervalSince1970: timeToDoulble!)
                    lblDate.text = formatter.string(from: date)
                }
            }
        }
    }
    
    var isChecked: Int = 0
    {
        didSet
        {
            if isChecked == 0
            {
                lblCustomerName.placeholder = ""
                lblCustomerName.isUserInteractionEnabled = false
                
                lblAddress.placeholder = ""
                lblAddress.isUserInteractionEnabled = false
                
                lblPhone.placeholder = ""
                lblPhone.isUserInteractionEnabled = false
                
                lblNote.placeholder = ""
                lblNote.isUserInteractionEnabled = false
                
                lblMonney.placeholder = ""
                lblMonney.isUserInteractionEnabled = false
                
                lblDate.placeholder = ""
                lblDate.isUserInteractionEnabled = false
            }
            else if isChecked == 1
            {
                lblCustomerName.isUserInteractionEnabled = true
                
                lblAddress.isUserInteractionEnabled = true
                
                lblPhone.isUserInteractionEnabled = true
                
                lblNote.isUserInteractionEnabled = true
                
                lblMonney.isUserInteractionEnabled = true
                
                lblDate.text = "Mặc định ngày hiện tại"
                lblDate.isUserInteractionEnabled = false
            }
            else
            {
                lblCustomerName.isUserInteractionEnabled = true
                
                lblAddress.isUserInteractionEnabled = true
                
                lblPhone.isUserInteractionEnabled = true
                
                lblNote.isUserInteractionEnabled = true
                
                lblMonney.isUserInteractionEnabled = false
                
                lblDate.isUserInteractionEnabled = false
            }
        }
    }
    
    var moneyNeedPay: Int = 0 {
        didSet {
            lblMonney.text = "\(commasCurreny(price: moneyNeedPay) ?? "0") \(getSymbol(forCurrencyCode: "VND") ?? "đ")"
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()
    {
        addSubview(lblCustomerNameTitle)
        addSubview(lblCustomerName)
        
        lblCustomerNameTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblCustomerName.anchor(top: topAnchor, leading: lblCustomerNameTitle.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblCustomerName.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        //................
        
        addSubview(lblAddressTitle)
        addSubview(lblAddress)
        
        lblAddressTitle.anchor(top: lblCustomerNameTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblAddress.anchor(top: lblCustomerName.bottomAnchor, leading: lblCustomerName.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblAddress.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        
        //......................
        
        addSubview(lblPhoneTitle)
        addSubview(lblPhone)
        
        lblPhoneTitle.anchor(top: lblAddressTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblPhone.anchor(top: lblAddress.bottomAnchor, leading: lblAddress.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblPhone.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        //..............
        
        addSubview(lblNoteTitle)
        addSubview(lblNote)
        
        lblNoteTitle.anchor(top: lblPhoneTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblNote.anchor(top: lblPhone.bottomAnchor, leading: lblPhone.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblNote.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        // ....................
        
        addSubview(lblMonneyTitle)
        addSubview(lblMonney)
        
        lblMonneyTitle.anchor(top: lblNoteTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblMonney.anchor(top: lblNote.bottomAnchor, leading: lblNote.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblMonney.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        //......................
        
        addSubview(lblDateTitle)
        addSubview(lblDate)
        
        lblDateTitle.anchor(top: lblMonneyTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 50))
        lblDate.anchor(top: lblMonney.bottomAnchor, leading: lblMonney.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: self.frame.width, height: 50))
        lblDate.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
    }
    
    func _PHCurrencyFieldDidChangeText(PHCurrencyField field: PHCurrencyField?, price: Double?) {
        if let p = price {
            self.lblMonney.text = "\(commasCurreny(price: Int(p)) ?? "0")\(getSymbol(forCurrencyCode: "VND") ?? "đ")"
        } else {
             self.lblMonney.text = "0đ"
        }
    }
    
}
