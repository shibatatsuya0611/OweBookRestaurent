//
//  knTabButton.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class knTabBarItem: UIButton
{
    var itemHeight: CGFloat = 0
    // (2)
    var lock = false
    // (3)
    var color: UIColor = UIColor.lightGray {
        didSet {
            guard lock == false else { return }
            iconImageView.change(color: color)
            textLabel.textColor = color
        }}

    // (4)
    let iconImageView = knUIMaker.makeImageView(contentMode: .scaleAspectFit)
    let textLabel = knUIMaker.makeLabel(font: UIFont.systemFont(ofSize: 11),
                                        color: .black, alignment: .center)

    convenience init(icon: UIImage, title: String,
                    font: UIFont = UIFont.systemFont(ofSize: 11)) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = icon
        textLabel.text = title
        textLabel.font = UIFont(name: font.fontName, size: 11)
        setupView()
    }

    // (5)
    private func setupView() {
        addSubview(iconImageView)
        iconImageView.top(toView: self, space: 4)
        iconImageView.centerX(toView: self)
        iconImageView.square()

        let iconBottomConstant: CGFloat = textLabel.text == "" ? -2 : -20
        iconImageView.bottom(toView: self, space: iconBottomConstant)

        textLabel.bottom(toView: self, space: -2)
        textLabel.centerX(toView: self)
    }

}
