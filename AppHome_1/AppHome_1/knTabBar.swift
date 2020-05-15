//
//  knTabbar.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class knTabBar: UITabBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var kn_items = [knTabBarItem]()
    convenience init(items: [knTabBarItem])
    {
        self.init()
        kn_items = items
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    override var tintColor: UIColor! {
        didSet {
            for item in kn_items {
                item.color = tintColor
            }}}

    func setupView() {
        backgroundColor = .white
        if kn_items.count == 0 { return }

        // (2)
        let line = knTabBarItem.makeLine(color: .gray, height: 0.5)
        addSubview(line)
        line.horizontal(toView: self)
        line.top(toView: self)

        // (3)
        var horizontalConstraints = "H:|"
        let itemWidth: CGFloat = screenWidth / CGFloat(kn_items.count)
        for i in 0 ..< kn_items.count {
            let item = kn_items[i]
            addSubviews(views: item)
            if item.itemHeight == 0 {
               
                item.vertical(toView: self)
            }
            else {
                item.bottom(toView: self)
                item.height(item.itemHeight)
            }
            item.width(itemWidth)
            horizontalConstraints += String(format: "[v%d]", i)
            if item.lock == false {
                item.color = tintColor
            }
        }

        horizontalConstraints += "|"
        addConstraints(withFormat: horizontalConstraints, arrayOf: kn_items)
    }
}
