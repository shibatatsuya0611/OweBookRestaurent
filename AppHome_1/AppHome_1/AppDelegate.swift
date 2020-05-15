//
//  AppDelegate.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/25/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import Toast_Swift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
var fireBaseRef: DatabaseReference!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        FirebaseApp.configure()
        fireBaseRef = Database.database().reference()
//        self.fireBaseRef.child("customer").child("Nguyen Van B").setValue(["name": "Nguyen Van B", "address": "Ha Noi", "phone": "098717236", "note": "no note", "totalowe": "200000", "date": "09/04/2020"])
//        self.fireBaseRef.child("pets").child("meo meo 2").setValue(["name": "meo meo 2", "age": "4"])
//        self.fireBaseRef.child("pets").child("meo meo 3").setValue(["name": "meo meo 3", "age": "5"])
        
        window = UIWindow()
        UIApplication.shared.statusBarView?.backgroundColor = mainColor
        if let window = self.window
        {
            if CURRENT_USER_ID != 0
            {
                let vc = MainTabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                window.rootViewController = vc
            }
            else
            {
                let vc = SigInViewViewController()
                vc.modalPresentationStyle = .fullScreen
                let SignNav = UINavigationController()
                SignNav.initRootViewController(vc: vc)
                window.rootViewController = SignNav
            }
//            let vc = PulseAnimationViewController()
//            vc.modalPresentationStyle = .fullScreen
//            let SignNav = UINavigationController()
//            SignNav.initRootViewController(vc: vc)
//            window.rootViewController = SignNav
            window.makeKeyAndVisible()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

}

