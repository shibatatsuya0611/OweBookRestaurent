//
//  UIStackView_Extensions.swift
//  Bai_3
//
//  Created by Xuan Huy on 11/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func changeBackgroundColor(color: UIColor)
    {
        let backgroundLayer = CAShapeLayer()
        self.layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }
}
