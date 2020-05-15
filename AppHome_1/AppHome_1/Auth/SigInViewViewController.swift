//
//  SigInViewViewController.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import Material
import Toast_Swift
import SQLite
import FirebaseAuth


class SigInViewViewController: UIViewController, TextFieldDelegate {

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
    
    let lblTile: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Sổ ghi nợ"
        lbl.textColor = mainColor
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize30)
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let imgLogo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = #imageLiteral(resourceName: "tuc-gian")
        
        return img
    }()
    
    fileprivate var emailField: ErrorTextField!
    fileprivate var passwordField: TextField!
    
    let btnSignin: RaisedButton = {
        let btn = RaisedButton(title: "Đăng nhập", titleColor: .white)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        btn.layer.cornerRadius = 16
        btn.layer.masksToBounds = true
        btn.backgroundColor = mainColor
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize13)
        
        return btn
    }()
    
    let lblFogotPass: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Quên mật khẩu?"
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize13)
        lbl.textAlignment = .center
        
        
        return lbl
    }()

    
    /// A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32
    fileprivate let constantButton: CGFloat = 36
    fileprivate var constantMarginTop: CGFloat!
    
    var heightConstraintContainerView: NSLayoutConstraint?
    
    var data: [users] = []
    var strUser = ""
    var strPass = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Sigin")
//        view.backgroundColor = bgcolorHoSoRestaur
        self.navigationController?.isNavigationBarHidden = true
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.setBackgroundImage(image: "bg_app")
        hideKeyBoardWhenTapAround()
        
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        setupView()
        
        prepareEmailField()
        preparePasswordField()
        prepareButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.view.setNeedsLayout() // force update layout
        navigationController?.view.layoutIfNeeded() // to fix height of the navigation bar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    fileprivate func setupView() {
        constantMarginTop = DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6_8 ? self.view.frame.width / 4 : self.view.frame.width / 3.5
        mainScrollView.addSubview(containerView)
        containerView.anchor(top: mainScrollView.topAnchor, leading: mainScrollView.leadingAnchor, bottom: mainScrollView.bottomAnchor, trailing: mainScrollView.trailingAnchor, padding: .zero, size: .init(width: self.view.frame.width, height: 0))
        heightConstraintContainerView = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: caculateHeightConstraint())
        mainScrollView.addConstraint(heightConstraintContainerView!)
        
        containerView.addSubview(imgLogo)
        containerView.addSubview(lblTile)
        
        // self.view.frame.width / 3.5 + 44
        imgLogo.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: constantMarginTop, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 150))
        imgLogo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        lblTile.anchor(top: imgLogo.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 10, bottom: 0, right: 10), size: .zero)
        lblTile.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
        
    fileprivate func prepareEmailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "Tên tài khoản"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = false
        emailField.placeholderAnimation = .default
        emailField.placeholderActiveColor = mainColor
        emailField.dividerActiveColor = mainColor
        emailField.autocorrectionType = .no
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = UIReturnKeyType.done
        
        containerView.addSubview(emailField)
        // 70 + constant
        emailField.anchor(top: lblTile.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: constant))
    }
        
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Mật khẩu"
        passwordField.detail = "lớn hơn 6 ký tự"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true // enable password field
        passwordField.placeholderActiveColor = mainColor
        passwordField.dividerActiveColor = mainColor
        passwordField.autocorrectionType = .no
        passwordField.delegate = self
        
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        containerView.addSubview(passwordField)
        // 50 + constant
        passwordField.anchor(top: emailField.bottomAnchor, leading: emailField.leadingAnchor, bottom: nil, trailing: emailField.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: constant))
    }
    fileprivate func prepareButton() {
    containerView.addSubview(btnSignin)
    // 60 + constantButton
    btnSignin.anchor(top: passwordField.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 60, left: 0, bottom: 0, right: 0), size: .init(width: 270, height: constantButton))
    btnSignin.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    /// Handle the resign responder button.
        @objc internal func handleResignResponderButton(button: UIButton) {
    //        emailField?.resignFirstResponder()
    //        passwordField?.resignFirstResponder()
            if emailField.text == "" {
                emailField.error = "Nhập tài khoản của bạn"
                 _ = emailField?.becomeFirstResponder()
                return
            } else {
                emailField.error = ""
            }
            
            if passwordField.text == "" {
                _ = passwordField?.becomeFirstResponder()
                self.view.makeToast("Mật khẩu là bắt buộc", duration: 3.0, position: .top)
                return
            }
            
            if passwordField.text?.count ?? 0 < 6 {
                _ = passwordField?.becomeFirstResponder()
                passwordField.detailColor = mainColor
                
                return
            } else {
                passwordField.detailColor = passwordField.placeholderNormalColor
            }
            view.endEditing(true)
            handleLogin()
        }
    fileprivate func handleLogin()
    {
        let loading = self.displaySpinner(onView: view)
        self.strUser = emailField.text ?? ""
        self.strPass = passwordField.text ?? ""
//        Auth.auth().signIn(withEmail: self.strUser, password: self.strPass) {(firUser, error) in
//            if firUser != nil
//            {
//                INIT_USER_DEFAULTS.set(firUser. as? Int ?? 0, forKey: "currentUserId")
//                               // save user number phone
////                INIT_USER_DEFAULTS.set(search.phone, forKey: "phoneCurrentUser")
//                self.removeSpinner(spinner: loading)
//                self.view.makeToast("Xin chào, \(self.strUser)", duration: 2.0, position: .top)
//                if let shareDelegate = UIApplication.shared.delegate as? AppDelegate
//                {
//                    let vc = MainTabBarViewController()
//                    vc.modalPresentationStyle = .fullScreen
//                    shareDelegate.window?.rootViewController = vc
//                }
//                else
//                {
//                    // item could not be found
//                    self.view.makeToast("Không Thể đăng nhập")
//                }
//
//                let petViewController: Search = Search()
//                self.navigationController?.pushViewController(petViewController, animated: true)
//            }
//            else
//            {
//                self.view.makeToast("Xảy ra lỗi khi đăng nhập !", duration: 2.0, position: .top)
//            }
//        }
        if let search = userData.share.userList.first(where: {$0.username.lowercased() == strUser.lowercased()})
        {
            if search.password == strPass
            {
                INIT_USER_DEFAULTS.set(search.id as? Int ?? 0, forKey: "currentUserId")
                               // save user number phone
                INIT_USER_DEFAULTS.set(search.phone, forKey: "phoneCurrentUser")
                
                print("pass \(strPass)")
                self.removeSpinner(spinner: loading)
                // do something with foo
                 self.view.makeToast("Xin chào, \(search.username)", duration: 2.0, position: .top)
                 if let shareDelegate = UIApplication.shared.delegate as? AppDelegate
                 {
                     let vc = MainTabBarViewController()
                     vc.modalPresentationStyle = .fullScreen
                     shareDelegate.window?.rootViewController = vc
                 }
                 else
                 {
                     self.removeSpinner(spinner: loading)
                    // item could not be found
                     self.view.makeToast("Không Thể đăng nhập")
                 }
            }
            else
            {
                self.removeSpinner(spinner: loading)
                self.view.makeToast("Sai mật khẩu")
            }
            
        }
        else
        {
            self.removeSpinner(spinner: loading)
            self.view.makeToast("Xảy ra lỗi khi đăng nhập !", duration: 2.0, position: .top)
        }
//        let loading = self.displaySpinner(onView: view)
//        let sv = ServicesApi()
//        sv.login(email: emailField.text!, pass: passwordField.text!, token: FCM_TOKEN) { response in
//            print("response \(response)")
//        if let userQuery = User.share.login(username: emailField.text!, passw: passwordField.text!)
//        {
//            let f = User.share.toString(user: userQuery)
//            print("fffff \(userQuery)")
//            try Database.share.connection?.scalar(user.count)
//            let data = [PHSyncResponse].self
//            for eachUser in userQuery
//            {
//                self.removeSpinner(spinner: loading)
////                User.share.toString(user: eachUser)
//                data = [User.share.toString(user: eachUser)]
//            }
//        }
//            self.removeSpinner(spinner: loading)
//            if response["state"] as? String ?? "" == "success" {
//                if let data = response["data"] as? PHSyncResponse, let user = data["user"] as? PHSyncResponse {
//
//                    INIT_USER_DEFAULTS.set(user["id"] as? Int ?? 0, forKey: "currentUserId")
//                    let vc = ListRestaurantsViewController()
//                    self.navigationController?.initRootViewController(vc: vc, transitionType: kCATransitionFromBottom, duration: 0.3)
//                }
//            } else {
//                self.view.makeToast(response["message"] as? String)
//            }
//        }
    }
    
    // MARK -- TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = true
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
    
    // caculate height constraint
    fileprivate func caculateHeightConstraint() -> CGFloat {
        let heightStatusBar = UIApplication.shared.statusBarFrame.height
        let heightTabBar = self.tabBarController?.tabBar.frame.height ?? 0
        let heightView = self.view.frame.height - heightTabBar - heightStatusBar
        let heightButtons = constantButton * 4
        let heightConstant = constant * 2
        
        let currentHeight: CGFloat = constantMarginTop + 290 + heightConstant + heightButtons + 175
        
        if currentHeight > heightView {
            return currentHeight
        } else {
            return heightView
        }
    }
}
