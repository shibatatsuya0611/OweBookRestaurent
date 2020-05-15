//
//  ProfileUserViewController.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class ProfileUserViewController: UIViewController
{

    lazy var refreshControl: UIRefreshControl = {
        let refesh = UIRefreshControl()
        refesh.tintColor = UIColor.lightGray
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        refesh.attributedTitle = NSAttributedString(string: "Tải thêm...", attributes: attributes)
        
        return refesh
    }()
    
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
    
    let viewThongKe: UIView =
    {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    let imgThongKe: UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dollar")
        
        return img
    }()
    
    let lblThongKe: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Thống kê"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let viewEditCustomer: UIView =
    {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    let imgEdit: UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "dollar")
        
        return img
    }()
    
    let lblEditCustome: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Sửa thông tin khách"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
//    let viewlogout: UIView =
//    {
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = .white
//        
//        return v
//    }()
//    
//    let imagebtnLogout: UIImageView =
//    {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.image = UIImage(named: "out")
//        
//        return img
//    }()
//    
//    let lblLogOut: UILabel =
//    {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Đăng Xuất"
//        lbl.textColor = coloStar
//        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize15)
//        lbl.textAlignment = .center
//        return lbl
//    }()
    
    fileprivate let constant: CGFloat = 32
    fileprivate var constantMarginTop: CGFloat!
    var heightConstraintContainerView: NSLayoutConstraint?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Thông tin người dùng"
        self.view.backgroundColor = bgcolorHoSoRestaur
        self.navigationController?.isNavigationBarHidden = false
        
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        prepareBtn()
        addRefeshControl()
        
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
        
        containerView.addSubview(viewThongKe)
        viewThongKe.addSubview(imgThongKe)
        viewThongKe.addSubview(lblThongKe)
        
        viewThongKe.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        imgThongKe.anchor(top: nil, leading: viewThongKe.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        imgThongKe.centerYAnchor.constraint(equalTo: viewThongKe.centerYAnchor).isActive = true
        
        lblThongKe.anchor(top: nil, leading: imgThongKe.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .zero)
        lblThongKe.centerYAnchor.constraint(equalTo: viewThongKe.centerYAnchor).isActive = true
        
        //..........
        containerView.addSubview(viewEditCustomer)
        viewEditCustomer.addSubview(imgEdit)
        viewEditCustomer.addSubview(lblEditCustome)
        
        viewEditCustomer.anchor(top: viewThongKe.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        imgEdit.anchor(top: nil, leading: viewEditCustomer.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        imgEdit.centerYAnchor.constraint(equalTo: viewEditCustomer.centerYAnchor).isActive = true
        
        lblEditCustome.anchor(top: nil, leading: imgEdit.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .zero)
        lblEditCustome.centerYAnchor.constraint(equalTo: viewEditCustomer.centerYAnchor).isActive = true
        
//        containerView.addSubview(viewlogout)
//        viewlogout.addSubview(imagebtnLogout)
//        viewlogout.addSubview(lblLogOut)
//
//        viewlogout.anchor(top: viewEditCustomer.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
//        lblLogOut.centerYAnchor.constraint(equalTo: viewlogout.centerYAnchor).isActive = true
//        lblLogOut.centerXAnchor.constraint(equalTo: viewlogout.centerXAnchor).isActive = true
//
//        imagebtnLogout.anchor(top: nil, leading: lblLogOut.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 20))
//        imagebtnLogout.centerYAnchor.constraint(equalTo: viewlogout.centerYAnchor).isActive = true
    }
    
    
    //MARK: function Action
    fileprivate func prepareBtn()
    {
        let gestureThongKe = UITapGestureRecognizer(target: self, action: #selector(btnThongKe(_:)))
        viewThongKe.isUserInteractionEnabled = true
        viewThongKe.addGestureRecognizer(gestureThongKe)
        
        let gestureEdit = UITapGestureRecognizer(target: self, action: #selector(btnEdit(_:)))
        viewEditCustomer.isUserInteractionEnabled = true
        viewEditCustomer.addGestureRecognizer(gestureEdit)
        
//        let gestureLogout = UITapGestureRecognizer(target: self, action: #selector(logout(_sender:)))
//        viewlogout.isUserInteractionEnabled = true
//        viewlogout.addGestureRecognizer(gestureLogout)
    }
    
//    @objc func logout(_sender: UITapGestureRecognizer)
//    {
//        print("Logout")
//        guard CURRENT_USER_ID != 0 else {
//            return
//        }
//        CURRENT_USER_ID = 0
//        INIT_USER_DEFAULTS.removeObject(forKey: "currentUserId")
//        INIT_USER_DEFAULTS.removeObject(forKey: "phoneCurrentUser")
//        if let shareDelegate = UIApplication.shared.delegate as? AppDelegate {
//            let vc = SigInViewViewController()
//            vc.modalPresentationStyle = .fullScreen
//            shareDelegate.window?.rootViewController = vc
//        }
//    }
    
    @objc func btnThongKe(_ sender: UITapGestureRecognizer)
    {
        print("Thong ke")
        let vc = TransactionsViewController()
        vc.title = "Thống Kê"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnEdit(_ sender: UITapGestureRecognizer)
    {
        print("Sua Thong Tin")
        let vc = Add_MinusController()
        vc.isCheck = 2
        vc.title = "Sửa thông tin"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addRefeshControl()
    {
        // Add Refresh Control to collection view
        if #available(iOS 10.0, *) {
//            self.collection.refreshControl = refreshControl
        }
        else
        {
//            self.collection.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
    }
    
    @objc private func updateData()
    {
        refreshControl.endRefreshing()
//        self.collection.data = []
//        self.collection.reloadData()
//        handlerData()
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
