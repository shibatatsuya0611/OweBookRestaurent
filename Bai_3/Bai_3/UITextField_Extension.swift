//
//  UITextField_Extension.swift
//  Bai_3
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

extension UITextField
{
    convenience init(placeholder: String?, fontSize: CGFloat, borderStyle: BorderStyle, parentStackView: UIStackView)
    {
        self.init()
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = self.font?.withSize(fontSize)
        self.borderStyle = borderStyle
        parentStackView.addArrangedSubview(self)
    }
}
