//
//  AlertView.swift
//  AppHome_1
//
//  Created by Xuan Huy on 5/4/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView
{
    static let instance = AlertView()
    
    let parentView: UIView =
    {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        
        return v
    }()
    
    let alertView: UIView =
    {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 10
        v.backgroundColor = .white
        
        return  v
    }()
    
    let lblTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Alert"
        lbl.textAlignment = .center
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let imgMicro: UIImageView =
    {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "iconMicro")
        
        return img
    }()
    
    let btnOK: UIButton =
    {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        btn.backgroundColor = .orange
        
        return btn
    }()
    
    var pulseLayers = [CAShapeLayer]()
    
    //MARK: didLoad
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupView()
        
        creatPulse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView()
    {
        addSubview(parentView)
        
        parentView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: frame.width, height: frame.height))
        
        
        parentView.addSubview(alertView)
        alertView.addSubview(lblTitle)
        alertView.addSubview(imgMicro)
        alertView.addSubview(btnOK)
        
        
        alertView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        lblTitle.anchor(top: alertView.topAnchor, leading: alertView.leadingAnchor, bottom: nil, trailing: alertView.trailingAnchor, padding: .zero, size: .init(width: 0, height: 30))
        lblTitle.addBorderWithContraint(color: .gray, bottomHeight: 0.5, rightWidth: 0, leftWidth: 0, topHeight: 0)
        
        
        imgMicro.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        imgMicro.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        imgMicro.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgMicro.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        btnOK.anchor(top: nil, leading: alertView.leadingAnchor, bottom: alertView.bottomAnchor, trailing: alertView.trailingAnchor, padding: .zero, size: .zero)
        btnOK.addBorderWithContraint(color: .gray, bottomHeight: 0, rightWidth: 0, leftWidth: 0, topHeight: 0.5)
        
        btnOK.addTarget(self, action: #selector(btnAlert(_sender:)), for: .touchUpInside)
        
        
    }
    
    //MARK: Animation
    func creatPulse()
    {
        for _ in 0...2
        {
            let cricularPath = UIBezierPath(arcCenter: .zero, radius: alertView.bounds.size.width / 2.3, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = cricularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.clear.cgColor
            
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: imgMicro.frame.size.width / 2.0, y: imgMicro.frame.size.width / 2.0)
            imgMicro.layer.addSublayer(pulseLayer)
            pulseLayers.append(pulseLayer)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.animatePulse(index: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.animatePulse(index: 1)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.animatePulse(index: 2)
                }
        }
    }
    func animatePulse(index: Int)
    {
        pulseLayers[index].strokeColor = UIColor.black.cgColor
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2.0
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 0.9
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation  = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 2.0
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        
        pulseLayers[index].add(opacityAnimation, forKey: "opacity")
    }
    
    
    enum AlertType
    {
        case success
        case failure
    }
    
    func showAlert(title: String, alertType: AlertType)
    {
        self.lblTitle.text = title
        
        switch alertType
        {
        case .success:
            btnOK.setTitle("Xong", for: .normal)
        case .failure:
            btnOK.setTitle("Cancel", for: .normal)
        }
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @objc func btnAlert(_sender: UIButton)
    {
        parentView.removeFromSuperview()
    }
}
