//
//  DeleteOweController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/26/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class DeleteOweController: UIViewController
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
    
    let btnDelete: UIButton =
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
    
    var id: Int = 0
    
    var data: [String: AnyObject]!
    {
        didSet
        {
            topview.data = data
        }
    }
//    var currentData: [Khach] = khachData.share.khachList
    
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
        containerView.addSubview(btnDelete)
        
        topview.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 400))
        
        btnDelete.anchor(top: topview.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
    }
    
    fileprivate func prepareBtn()
    {
        btnDelete.addTarget(self, action: #selector(deleteBtn(_:)), for: .touchUpInside)
    }
    
    
    //MARK: function
    @objc func deleteBtn(_ sender: UIButton)
    {
        print("delete")
        let alert = UIAlertController(title: "Chú ý", message: "Bạn có chắc chắn muốn gạch nợ cho khách hàng này ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: { action in
            switch action.style{
            case .default:
                print("Press Huỷ")

            case .cancel:
                print("cancel")

            case .destructive:
                print("destructive")
            @unknown default:
                break
            }
        }))
        alert.addAction(UIAlertAction(title: "Đồng ý", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("da xoa")
//                if let index = khachData.share.khachList.firstIndex(where: { $0.id == self.data.id })
//                {
//                    print("Đã gạch: \(khachData.share.khachList)")
//                    khachData.share.khachList.remove(at: index)
//                    self.view.makeToast("Đã Xoá")
//                    self.navigationController?.popToRootViewController(animated: true)
//                    print("data : \(khachData.share.khachList)")
//                }
                (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child(self.data!["name"] as! String).removeValue()
                self.navigationController?.popToRootViewController(animated: true)
                // then .. Insert
                (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child((self.data["name"] as? String)!).setValue(["name": self.data["name"] as? String, "address": self.data["address"] as? String, "date": self.data["date"] as? String, "note": self.data["note"] as? String, "phone": self.data["phone"] as? String, "totalowe": "\(0)"])
            case .cancel:
                print("cancel")

            case .destructive:
                print("destructive")
            @unknown default:
                break
            }
        }))
        self.present(alert, animated: true, completion: nil)
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
