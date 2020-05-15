//
//  InforOweController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/27/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class InforOweController: UIViewController
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
    
    let topview: AddNewOwe =
    {
       let t = AddNewOwe()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .clear
        t.isChecked = 0
        
        return t
    }()
    
    let btnAdd_Minus: UIButton =
    {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Thêm - trừ nợ", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        btn.backgroundColor = colorBtnEdit
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        
        
        return btn
    }()
    
    let btnDeleteOwe: UIButton =
    {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Gạch nợ", for: .normal)
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
    var strPhoneNumBerPerSon: String = ""
    
    var data: [String: AnyObject]!
    {
        didSet
        {
            self.strPhoneNumBerPerSon = (data["phone"] as? String)!
        }
    }
    
    var isCheckInfor: Bool = false
    {
        didSet
        {
            if isCheckInfor == true
            {
                btnAdd_Minus.isHidden = true
                btnDeleteOwe.isHidden = true
            }
            else
            {
                
            }
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        
        topview.data = data
        
        prepareBtn()
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
    fileprivate func setupView()
    {
        constantMarginTop = DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6_8 ? self.view.frame.width / 4 : self.view.frame.width / 3.5
        mainScrollView.addSubview(containerView)
        containerView.anchor(top: mainScrollView.topAnchor, leading: mainScrollView.leadingAnchor, bottom: mainScrollView.bottomAnchor, trailing: mainScrollView.trailingAnchor, padding: .zero, size: .init(width: self.view.frame.width, height: 0))
        heightConstraintContainerView = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: caculateHeightConstraint())
        mainScrollView.addConstraint(heightConstraintContainerView!)
        
        containerView.addSubview(topview)
        containerView.addSubview(btnAdd_Minus)
        containerView.addSubview(btnDeleteOwe)
        
        topview.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 400))
        
        btnAdd_Minus.anchor(top: topview.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.centerXAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 60))
        
        btnDeleteOwe.anchor(top: topview.bottomAnchor, leading: containerView.centerXAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 60))
    }
    
    
    //MARK:Function
    
    func prepareBtn()
    {
        btnAdd_Minus.addTarget(self, action: #selector(addMinus(_:)), for: .touchUpInside)
        
        btnDeleteOwe.addTarget(self, action: #selector(deleteOwe(_:)), for: .touchUpInside)
        
        let geturePhone = UITapGestureRecognizer(target: self, action: #selector(openPhonePerSon(_:)))
        topview.lblPhone.isUserInteractionEnabled = true
        topview.lblPhone.addGestureRecognizer(geturePhone)
    }
    
    @objc func addMinus(_ sender: UIButton)
    {
        print("addMinus")
        let vc = Add_Minus_Owe_Controller()
        vc.title = "Thêm - trừ nợ"
        vc.data = data
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func deleteOwe(_ sender: UIButton)
    {
        print("delete minus")
        
        let vc = DeleteOweController()
        vc.title = "Gạch nợ"
//        vc.data = data
        vc.data = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func openPhonePerSon(_ : UITapGestureRecognizer)
    {
        print("call Phone")
        //        UIApplication.sharedApplication().openURL(NSURL(string: "tel://1234567890"))
        UIApplication.shared.openURL(URL(string: "tel://\(String(describing: strPhoneNumBerPerSon))")!)
        print("strphone = \(strPhoneNumBerPerSon)")
    }
    
    
    
    
    
    
    
    
    
    
    
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
