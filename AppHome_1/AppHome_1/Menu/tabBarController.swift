//
//  tabBarController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/26/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit


class tabBarController: UITabBarController, UITabBarControllerDelegate
{

    var tabBarVC: UITabBarController!
    var cameraImageView: UIImageView = UIImageView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "Bai Viet"
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.barTintColor = .orange
        
        tabBarVC = UITabBarController()
        tabBarVC.delegate = self
        tabBarVC.tabBar.barStyle = .default
        tabBarVC.tabBar.tintColor = .red
        tabBarVC.tabBar.barTintColor = UIColor(red: 244/255, green: 84/255 , blue: 28/255, alpha: 1)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        // Do any additional setup after loading the view.
        let HomeVC = UINavigationController.init(rootViewController: ViewController())
        
        let likeVC = UINavigationController.init(rootViewController: ReViewController())
        likeVC.navigationBar.tintColor = .orange
        likeVC.navigationBar.barTintColor = UIColor(red: 244/255, green: 84/255 , blue: 28/255, alpha: 1)
        
        let CameraVC = CameraPicker()
            
        let bellVC = UINavigationController.init(rootViewController: notificaController())
        bellVC.navigationBar.tintColor = .orange
        bellVC.navigationBar.barTintColor = UIColor(red: 244/255, green: 84/255 , blue: 28/255, alpha: 1)
        
        let perSon = UINavigationController.init(rootViewController: profileController())
        perSon.navigationBar.tintColor = .orange
        perSon.navigationBar.barTintColor = UIColor(red: 244/255, green: 84/255 , blue: 28/255, alpha: 1)
        
        HomeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home32")?.withRenderingMode(.alwaysOriginal), tag: 0)
        likeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "like32")?.withRenderingMode(.alwaysOriginal), tag: 1)
        likeVC.setNeedsStatusBarAppearanceUpdate()
        CameraVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Camera")?.withRenderingMode(.alwaysOriginal), tag: 2)
        CameraVC.tabBarItem.imageInsets = UIEdgeInsets(top: -17, left: 0, bottom: 17, right:  0)
        
        bellVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "bell96")?.withRenderingMode(.alwaysOriginal), tag: 3)
        perSon.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "personfull")?.withRenderingMode(.alwaysOriginal), tag: 4)
         
        
           tabBarVC.viewControllers = [HomeVC, likeVC, CameraVC,bellVC,perSon]
        self.view.addSubview(tabBarVC.view)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
}
