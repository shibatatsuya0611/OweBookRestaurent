//
//  ViewController.swift
//  Bai7
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var lblSelectedItem: UILabel?
    @IBOutlet weak var pickerView: UIPickerView?

    var flowerName = ["Rose", "Lily", " Red Rose", "Violet", "Diamon", "Iron", "Imortal"]
    let rowheight:CGFloat = 50.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView?.selectRow(flowerName.count / 2, inComponent: 0, animated: true)
        lblSelectedItem?.text = flowerName[flowerName.count / 2]
    }
// ham trong UIPICKERVIEWDATASOURCE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowerName.count
    }
    // su dung ham trong UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowheight
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowerName[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSelectedItem?.text = flowerName[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label: UILabel?
        if (view == nil)
        {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: rowheight))
            
        }
        else
        {
            label = view as? UILabel
        }
        label!.text = flowerName[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 18)
        label?.textColor = .white
        label?.backgroundColor = .darkGray
        return label!
    }
}

