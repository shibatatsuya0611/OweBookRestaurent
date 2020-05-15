//
//  PageViewController.swift
//  Bai10
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController1") as! ViewController1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController2") as! ViewController2,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController3") as! ViewController3
        ]
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        // Do any additional setup after loading the view.
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
    }
    required init?(coder: NSCoder)
    {
        super.init(transitionStyle: . scroll, navigationOrientation: . horizontal, options: nil)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex <= 0)
        {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currenIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if(currenIndex >= subViewControllers.count-1)
        {
            return nil
        }
        return subViewControllers[currenIndex+1]
    }
    
}
