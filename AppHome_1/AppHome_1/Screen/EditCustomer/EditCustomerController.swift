//
//  EditCustomerController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/1/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class EditCustomerController: UIViewController
{

    let mainScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        return view
    }()
    
    let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        
        return v
    }()
    
    var topview: AddNewOwe =
    {
        let m = AddNewOwe()
        m.translatesAutoresizingMaskIntoConstraints = false
        m.backgroundColor = .clear
        m.isChecked = 3
        
        return m
    }()
    
    let btnEdit: UIButton =
    {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sửa thông tin", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        btn.backgroundColor = colorBtnEdit
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        
        return btn
    }()
    
    fileprivate let constant: CGFloat = 32
    fileprivate var constantMarginTop: CGFloat!
    var heightConstraintContainerView: NSLayoutConstraint?
    
    var data: [String: AnyObject]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        handlerData()
    }
    
    func handlerData()
    {
        self.topview.data = data
    }
    
    fileprivate func setupView()
    {
        constantMarginTop = DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6_8 ? self.view.frame.width / 4 : self.view.frame.width / 3.5
        mainScrollView.addSubview(containerView)
        containerView.anchor(top: mainScrollView.topAnchor, leading: mainScrollView.leadingAnchor, bottom: mainScrollView.bottomAnchor, trailing: mainScrollView.trailingAnchor, padding: .zero, size: .init(width: self.view.frame.width, height: 0))
        heightConstraintContainerView = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: caculateHeightConstraint())
        mainScrollView.addConstraint(heightConstraintContainerView!)
        
        containerView.addSubview(topview)
        containerView.addSubview(btnEdit)
        
        topview.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: self.view.frame.height / 1.5))
        
        btnEdit.anchor(top: topview.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        
        btnEdit.addTarget(self, action: #selector(EditCustomer(_:)), for: .touchUpInside)
    }
    
    @objc func EditCustomer(_ sender: UIButton)
    {
        print("edit")
        let monney = topview.lblMonney.text ?? "0"
        
        
        // using current date and time as an example
        let someDate = Date()

        // convert Date to TimeInterval (typealias for Double)
        let timeInterval = someDate.timeIntervalSince1970

        // convert to Integer
        let myIntDate = Int(timeInterval)
        
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child(self.data["name"] as! String).removeValue()
        
        checkTextField(name: topview.lblCustomerName.text?.lowercased() ?? "", address: topview.lblAddress.text ?? "", phone: topview.lblPhone.text?.lowercased() ?? "", note: topview.lblNote.text ?? "", owe: "\(Int(monney) ?? 0)", date: "\(myIntDate)")
        
    }
    
    func checkTextField(name: String, address: String, phone: String, note: String, owe: String, date: String)
    {
        guard let name = topview.lblCustomerName.text?.lowercased(), name != "" else
           {
               self.view.makeToast("Bạn chưa nhập tên khách")
               return
           }
        guard let address = topview.lblAddress.text, address != "" else
           {
               self.view.makeToast("Bạn chưa nhập địa chỉ")
               return
           }
        guard let phone = topview.lblPhone.text?.lowercased(), phone != "" else
           {
               self.view.makeToast("Bạn chưa nhập số điện thoạt")
               return
           }
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child("\(name)").setValue(["name": name, "address": address, "date": date , "note": note, "phone": phone, "totalowe": owe])
        self.navigationController?.popToRootViewController(animated: true)
            
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: Caculatate Height
    fileprivate func caculateHeightConstraint() -> CGFloat
    {
        let heightStatusBar = UIApplication.shared.statusBarFrame.height
        let heightTabBar = self.tabBarController?.tabBar.frame.height ?? 0
        let heightNavBar = self.navigationController?.navigationBar.frame.height ?? 0
        let heightView = self.view.frame.height - heightTabBar - heightStatusBar - heightNavBar
        let heightConstant = constant * 2
        
        let currentHeight: CGFloat = constantMarginTop + 290 + heightConstant + 175
        
        if currentHeight > heightView {
            return currentHeight
        }
        else
        {
            return heightView
        }
    }
}
