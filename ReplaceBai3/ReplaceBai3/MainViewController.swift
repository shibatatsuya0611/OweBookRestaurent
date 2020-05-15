//
//  MainViewController.swift
//  ReplaceBai3
//
//  Created by Xuan Huy on 11/4/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainStackView: UIStackView = UIStackView()
    
    var stackview1: UIStackView = UIStackView()
    
    var txtViewDesciption: UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.autolayoutMainStackView()
        self.autolayoutStackView1()
        self.autolayoutTexViewDescription()
    }
    
    private func autolayoutMainStackView()
    {
        view.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
       // mainStackView.backgroundColor = UIColor.blue // khong the set
        
    }

    private func autolayoutStackView1()
    {
        mainStackView.addArrangedSubview(stackview1)
        stackview1.translatesAutoresizingMaskIntoConstraints = false
        stackview1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    private func autolayoutTexViewDescription()
    {
        mainStackView.addArrangedSubview(txtViewDesciption)
        txtViewDesciption.text = " Your Description...."
        txtViewDesciption.font = txtViewDesciption.font?.withSize(15)
        txtViewDesciption.backgroundColor = UIColor(red: 234.0 / 255.0, green: 221.0 / 255.0, blue: 209.0 / 255.0, alpha: 1)
        txtViewDesciption.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        mainStackView.changeBackgroundColor(color: UIColor.cyan)
        stackview1.changeBackgroundColor(color: .orange)
    }
}
