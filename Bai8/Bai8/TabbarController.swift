//
//  TabbarController.swift
//  Bai8
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    
    var viewController1: ViewController1?
    var viewController2: ViewController2?
    var viewController3: ViewController3?
    var subviewController: [UIViewController] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        viewController1 = ViewController1()
        viewController2 = ViewController2()
        viewController3 = ViewController3()
        
        // add subView
        subviewController.append(viewController1!)
        subviewController.append(viewController2!)
        subviewController.append(viewController3!)
        
        viewController1?.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "i_home"), selectedImage: #imageLiteral(resourceName: "tohka1.jpeg"))
        viewController1?.tabBarItem.tag = 0
        viewController2?.tabBarItem = UITabBarItem(title: "Hand", image: #imageLiteral(resourceName: "ihand.png"), selectedImage: #imageLiteral(resourceName: "myuky1.jpeg"))
        viewController2?.tabBarItem.tag = 1
        viewController3?.tabBarItem = UITabBarItem(title: "Like", image: #imageLiteral(resourceName: "ilike.png"), selectedImage: #imageLiteral(resourceName: "tohka.jpeg"))
        viewController3?.tabBarItem.tag = 2
        
        
        self.setViewControllers(subviewController, animated: true)
        
        self.selectedIndex = 0
        self.selectedViewController = viewController1
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("tab 0")
            tabBar.tintColor = .red
        case 1:
            print("tab 1")
            self.tabBar.tintColor = .green
        case 2:
            print("tab 2")
            self.tabBar.tintColor = .blue
        default:
            print("no tab")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
