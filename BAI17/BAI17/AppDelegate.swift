//
//  AppDelegate.swift
//  BAI17
//
//  Created by Xuan Huy on 11/9/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
         let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        window?.rootViewController = SwipeCollectionViewController(collectionViewLayout: collectionViewFlowLayout)
        
        return true
    }

    // MARK: UISceneSession Lifecycle
}

