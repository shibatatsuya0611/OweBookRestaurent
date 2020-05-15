//
//  Add_MinusController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/26/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class Add_MinusController: UIViewController
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
    
    let lblCustomNameTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nhập tên khách để tìm"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize18)
        
        return lbl
    }()
    
    let lblCustomeName: PHTextField =
    {
       let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập tên khách"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let btnSearchCustome: UIButton =
    {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Tìm", for: .normal)
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
    
    var isCheck: Int = 0
    
//    var data: [Khach] = khachData.share.khachList
    var data: [customer] = [customer]()
    
    var strSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        
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
        
        containerView.addSubview(lblCustomNameTitle)
        containerView.addSubview(lblCustomeName)
        containerView.addSubview(btnSearchCustome)
        
        lblCustomNameTitle.anchor(top: nil, leading: nil, bottom: containerView.centerYAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 60, right: 0), size: .zero)
//        lblCustomNameTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        lblCustomNameTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        lblCustomeName.anchor(top: lblCustomNameTitle.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        lblCustomeName.addBorderWithContraint(color: .gray, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        
        btnSearchCustome.anchor(top: lblCustomeName.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 60))
        btnSearchCustome.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        btnSearchCustome.addTarget(self, action: #selector(SearchCustomer(_:)), for: .touchUpInside)
    }
    
    
    //MARK: Function
    
    @objc func SearchCustomer(_ sender: UIButton)
    {
        print("data: \(data.count)")
        self.strSearch = lblCustomeName.text?.lowercased() ?? ""
//        if let search = khachData.share.khachList.first(where: {$0.name.lowercased() == strSearch.lowercased()})
//        {
           // do something with foo
//            print("strSearch = \(strSearch)")
//            print("search: \(search)")
//            if self.isCheck == 1
//            {
//                print("Search Customer to Add_Minus_Owe")
//                let vc = Add_Minus_Owe_Controller()
//                vc.title = self.title
//                vc.data = search
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if self.isCheck == 0
//            {
//                print("Search Customer to Delete_Owe")
//                let vc = DeleteOweController()
//                vc.title = self.title
//                vc.data = search
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else
//            {
//                print("Search Customer to Edit")
//                let vc = EditCustomerController()
//                vc.title = self.title
//                vc.data = search
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
//        else
//        {
//           // item could not be found
//            self.view.makeToast("Không tìm thấy !")
//        }
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef!.child("customer").queryOrdered(byChild: "name").queryStarting(atValue: strSearch).queryEnding(atValue: strSearch + "\u{f8ff}").observeSingleEvent(of: .value, with: { res in

          print("snapshot respone: \(res)")
            let dictRoot = res.value as? [String: AnyObject] ?? [:]
            let dictCustomer = dictRoot["customer"] as? [String: AnyObject] ?? [:]
            for key in Array(dictCustomer.keys).sorted().reversed()
            {
                self.data.append(customer(dictionary: dictCustomer[key] as! [String: AnyObject], key: key))
            }
             var d: [[String: AnyObject]] = []
             if let v = res.value as? [String: AnyObject] {
                 for (_, val) in v {
                    if v.count == 1
                     {
                        if let val = val as? [String: AnyObject] {
                            d.append(val)
                           if self.isCheck == 1
                           {
                               print("Search Customer to Add_Minus_Owe")
                               let vc = Add_Minus_Owe_Controller()
                               vc.title = self.title
                               vc.data = val
                               self.navigationController?.pushViewController(vc, animated: true)
                           }
                           else if self.isCheck == 0
                           {
                               print("Search Customer to Delete_Owe")
                               let vc = InforOweController()
                               vc.isCheckInfor = true
                               vc.title = self.title
                               vc.data = val
                               self.navigationController?.pushViewController(vc, animated: true)
                           }
                           else
                           {
                               print("Search Customer to Edit")
                               let vc = EditCustomerController()
                               vc.title = self.title
                               vc.data = val
                               self.navigationController?.pushViewController(vc, animated: true)
                           }
                        }
                    }
                    else
                     {
                        self.view.makeToast("Không tìm thấy")
                    }
                 }
//                 if d.count > 0
//                 {
//                    print("strSearch = \(self.strSearch)")
//                     print("search: \(d)")
//                     if self.isCheck == 1
//                     {
//                         print("Search Customer to Add_Minus_Owe")
//                         let vc = Add_Minus_Owe_Controller()
//                         vc.title = self.title
//                         vc.data = d
//                         self.navigationController?.pushViewController(vc, animated: true)
//                     }
//                     else if self.isCheck == 0
//                     {
//                         print("Search Customer to Delete_Owe")
//                         let vc = DeleteOweController()
//                         vc.title = self.title
//                         vc.data = d
//                         self.navigationController?.pushViewController(vc, animated: true)
//                     }
//                     else
//                     {
//                         print("Search Customer to Edit")
//                         let vc = EditCustomerController()
//                         vc.title = self.title
//                         vc.data = d
//                         self.navigationController?.pushViewController(vc, animated: true)
//                     }
//                 }
//                 else
//                 {
//                     print("d is null")
//                    self.view.makeToast("Không tìm thấy")
//                 }
             }

        })
        
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
