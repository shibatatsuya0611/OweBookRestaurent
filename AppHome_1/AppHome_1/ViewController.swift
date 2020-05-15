//
//  ViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/25/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

}

