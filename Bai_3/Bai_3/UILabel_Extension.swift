//
//  UILabel_Extension.swift
//  Bai_3
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String?, fontSize: CGFloat, parentStackView: UIStackView)
    {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = self.font?.withSize(fontSize)
        parentStackView.addArrangedSubview(self)
    }
}
