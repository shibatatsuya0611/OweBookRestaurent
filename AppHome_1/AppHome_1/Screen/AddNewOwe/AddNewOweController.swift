//
//  AddNewOweController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/26/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class AddNewOweController: UIViewController, checkTextField
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
    
    let mainView: AddNewOwe =
    {
        let m = AddNewOwe()
        m.translatesAutoresizingMaskIntoConstraints = false
        m.backgroundColor = .clear
        m.isChecked = 1
        
        return m
    }()
    
    let btnAddOwe: UIButton =
    {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Thêm", for: .normal)
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
    
//    var data: [Khach] = []
    var data: [customer] = [customer]()
    
    
    //MARK: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        mainView.delegate = self
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.view.setNeedsLayout() // force update layout
        navigationController?.view.layoutIfNeeded() // to fix height of the navigation bar
    }
    
    
    func handlerData()
    {
//        self.data = khachData.share.khachList
        self.data = [customer]()
    }
    
    //MARK: SETUP VIEW
    fileprivate func setupView()
    {
        constantMarginTop = DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6_8 ? self.view.frame.width / 4 : self.view.frame.width / 3.5
        mainScrollView.addSubview(containerView)
        containerView.anchor(top: mainScrollView.topAnchor, leading: mainScrollView.leadingAnchor, bottom: mainScrollView.bottomAnchor, trailing: mainScrollView.trailingAnchor, padding: .zero, size: .init(width: self.view.frame.width, height: 0))
        heightConstraintContainerView = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: caculateHeightConstraint())
        mainScrollView.addConstraint(heightConstraintContainerView!)
        
        containerView.addSubview(mainView)
        mainView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 5), size: .init(width: 0, height: 400))
//        mainView.backgroundColor = .red
        
        containerView.addSubview(btnAddOwe)
        btnAddOwe.anchor(top: mainView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        btnAddOwe.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        btnAddOwe.addTarget(self, action: #selector(addOwe), for: .touchUpInside)
    }
    
    
    //MARK: BUTTON
    @objc func addOwe()
    {
        print("Them moi")
        
        let monney = mainView.lblMonney.text ?? "0"
        
        
        // using current date and time as an example
        let someDate = Date()

        // convert Date to TimeInterval (typealias for Double)
        let timeInterval = someDate.timeIntervalSince1970

        // convert to Integer
        let myIntDate = Int(timeInterval)
        
        checkTextField(name: mainView.lblCustomerName.text?.lowercased() ?? "", address: mainView.lblAddress.text ?? "", phone: mainView.lblPhone.text?.lowercased() ?? "", note: mainView.lblNote.text ?? "", owe: "\(Int(monney) ?? 0)", date: "\(myIntDate)")
        
    }
    
    func checkTextField(name: String, address: String, phone: String, note: String, owe: String, date: String)
    {
        guard let name = mainView.lblCustomerName.text?.lowercased(), name != "" else
           {
               self.view.makeToast("Bạn chưa nhập tên khách")
               return
           }
        guard let address = mainView.lblAddress.text, address != "" else
           {
               self.view.makeToast("Bạn chưa nhập địa chỉ")
               return
           }
        guard let phone = mainView.lblPhone.text?.lowercased(), phone != "" else
           {
               self.view.makeToast("Bạn chưa nhập số điện thoạt")
               return
           }
        guard let monney = mainView.lblMonney.text, monney != "" else
           {
               self.view.makeToast("Bạn chưa nhập số tiền")
               return
           }
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child("\(name)").setValue(["name": name, "address": address, "date": date , "note": note, "phone": phone, "totalowe": owe])
        self.navigationController?.popToRootViewController(animated: true)
            
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: Caculate Height
    
    fileprivate func caculateHeightConstraint() -> CGFloat
    {
        let heightStatusBar = UIApplication.shared.statusBarFrame.height
        let heightTabBar = self.tabBarController?.tabBar.frame.height ?? 0
        let heightNavBar = self.navigationController?.navigationBar.frame.height ?? 0
        let heightView = self.view.frame.height - heightTabBar - heightStatusBar - heightNavBar
        let heightConstant = constant * 2
        
        let currentHeight: CGFloat = constantMarginTop + 290 + heightConstant + 175 + 75
        
        if currentHeight > heightView {
            return currentHeight
        }
        else
        {
            return heightView
        }
    }
}
