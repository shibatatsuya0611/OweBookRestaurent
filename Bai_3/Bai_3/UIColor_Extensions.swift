//
//  UIColor_Extensions.swift
//  Bai_3
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

 extension UIColor
{
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat)
    {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}
