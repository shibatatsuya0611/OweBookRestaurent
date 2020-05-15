//
//  TestAnimationViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 5/2/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class TestAnimationViewController: UIViewController
{
    let view1: UIView =
    {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 75
        
        return v
    }()
    
    let view2: UIView =
    {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 50
        
        return v
    }()
    
    let view3: UIView =
    {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 25
        
        return v
    }()
    
    let imgview3: UIImageView =
    {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "iconMicro")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        
        return img
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    fileprivate func setupView()
    {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view3.addSubview(imgview3)
        
        view1.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 150, height: 150))
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view2.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 100, height: 100))
        view2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view3.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 50, height: 50))
        view3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imgview3.anchor(top: view3.topAnchor, leading: view3.leadingAnchor, bottom: view3.bottomAnchor, trailing: view3.trailingAnchor, padding: .zero, size: .init(width: 50, height: 50))
    }
    
    func setupAnimation()
    {
        
    }
    
    @objc func animateView1()
    {
        
        UIView.animate(withDuration: 3, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            
        }, completion: nil)
    }
}
