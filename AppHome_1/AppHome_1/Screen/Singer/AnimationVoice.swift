//
//  AnimationVoice.swift
//  AppHome_1
//
//  Created by Xuan Huy on 5/4/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class AnimationVoice: UIView
{
    
    let imgview3: UIImageView =
    {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "iconMicro")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = img.frame.size.width / 2
        
        return img
    }()
    
    var pulseLayers = [CAShapeLayer]()
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(imgview3)
        
        imgview3.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 50, height: 50))
        imgview3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgview3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        creatPulse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatPulse()
    {
        for _ in 0...2
        {
            let cricularPath = UIBezierPath(arcCenter: .zero, radius: self.bounds.size.width / 2.3, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = cricularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.clear.cgColor
            
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: imgview3.frame.size.width / 2.0, y: imgview3.frame.size.width / 2.0)
            imgview3.layer.addSublayer(pulseLayer)
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
}
