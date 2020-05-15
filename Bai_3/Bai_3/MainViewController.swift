//
//  MainViewController.swift
//  Bai_3
//
//  Created by Xuan Huy on 11/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainStackView: UIStackView = UIStackView()
    
    var stackview1: UIStackView = UIStackView()
    
    var imageView: UIImageView = UIImageView()
    
    var stackView11: UIStackView = UIStackView()
    var labelfirst: UILabel?
    var labelSecon: UILabel?
    var labelthree: UILabel?
    
    var stackView12: UIStackView = UIStackView()
    var textfield1: UITextField?
    var textfield2: UITextField?
    var textfield3: UITextField?
    
    var txtViewDesciption: UITextView = UITextView()
    
    var stackView2: UIStackView = UIStackView()
    
    var btnCanCel: UIButton = UIButton()
    var btnSave: UIButton = UIButton()
    var btnClear: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("mau trang")
        // Do any additional setup after loading the view.
        self.autolayoutMainStackView()
        self.autolayoutStackView1()
        self.autolayoutTexViewDescription()
        self.autolayoutStackView2()
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
        // image
        
    }

    private func autolayoutStackView1()
    {
        mainStackView.addArrangedSubview(stackview1)
        stackview1.translatesAutoresizingMaskIntoConstraints = false
        stackview1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackview1.axis = .horizontal
        stackview1.alignment = .fill
        stackview1.distribution = .fill
        stackview1.spacing = 10
        
        //image stackview
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "tohka")
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
        stackview1.addArrangedSubview(imageView)
        
        // 3 label
        stackView11.translatesAutoresizingMaskIntoConstraints = false
        stackview1.addArrangedSubview(stackView11)
        stackView11.axis = .vertical
        stackView11.alignment = .leading
        stackView11.distribution = .fillEqually
        stackView11.spacing = 10
        
//
         labelfirst = UILabel(text: "First", fontSize: 15, parentStackView: stackView11)
         
//
        labelSecon = UILabel(text: "Secon", fontSize: 15, parentStackView: stackView11)
        
//        )
        labelthree = UILabel(text: "Three", fontSize: 15, parentStackView: stackView11)
        
        stackView11.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        // 3 text field
        stackView12.translatesAutoresizingMaskIntoConstraints = false
        stackview1.addArrangedSubview(stackView12)
        stackView12.axis = .vertical
        stackView12.alignment = .fill
        stackView12.distribution = .equalSpacing
        stackView12.spacing = 10
        
//
        textfield1 = UITextField(placeholder: "First", fontSize: 15, borderStyle: .roundedRect, parentStackView: stackView12)
        
//
        textfield2 = UITextField(placeholder: "Secon", fontSize: 15, borderStyle: .roundedRect, parentStackView: stackView12)
        
//
        textfield3 = UITextField(placeholder: "Three", fontSize: 15, borderStyle: .roundedRect, parentStackView: stackView12)
    }
    private func autolayoutTexViewDescription()
    {
        mainStackView.addArrangedSubview(txtViewDesciption)
        txtViewDesciption.text = " Your Description...."
        txtViewDesciption.font = txtViewDesciption.font?.withSize(15)
//
        txtViewDesciption.backgroundColor = UIColor(234 , 221, 209)
        txtViewDesciption.translatesAutoresizingMaskIntoConstraints = false
    }
    private func autolayoutStackView2()
    {
        mainStackView.addArrangedSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        //stackView2.backgroundColor = UIColor.blue
        stackView2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        // 3 BUTTONS
        btnCanCel.translatesAutoresizingMaskIntoConstraints = false
//
        btnCanCel.backgroundColor = UIColor(121, 200, 166)
        btnCanCel.setTitle("Cancel", for: .normal)
        btnCanCel.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnCanCel)
        
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        btnSave.backgroundColor = UIColor(121,200,166)
        btnSave.setTitle("Save", for: .normal)
        btnSave.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnSave)
        
        btnClear.translatesAutoresizingMaskIntoConstraints = false
        btnClear.backgroundColor = UIColor(121,200,166)
        btnClear.setTitle("Clear", for: .normal)
        btnClear.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnClear)
        
        // setting chieu cao button
        btnCanCel.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        btnSave.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        btnClear.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        // setting stackview2
        stackView2.axis = .horizontal
        stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        stackView2.spacing = 10
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
//        mainStackView.changeBackgroundColor(color: UIColor.cyan)
//        stackview1.changeBackgroundColor(color: .orange)
        print("view did appear")
        //stackView2.changeBackgroundColor(color: UIColor.blue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
}
