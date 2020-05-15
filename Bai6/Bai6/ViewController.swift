//
//  ViewController.swift
//  Bai6
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var progressView: UIProgressView?
    @IBOutlet weak var labelPogress: UILabel?
    let maxtime = 5.0 // 5 giay
    var currentTime = 0.0
    let timeInterval = 0.01 // refresh time
    var myTime: Timer?
    
    @IBAction func btnStart(sender: UIButton)
    {
        guard myTime == nil else {return}
        myTime?.invalidate()
        myTime = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateUI(sender:)), userInfo: nil, repeats: true)
    }
    @objc func updateUI(sender: Timer)
    {
        if (currentTime < maxtime)
        {
            currentTime = currentTime + timeInterval
            progressView?.progress = Float(currentTime / maxtime)
            labelPogress?.text = "\(Int(currentTime * 100 / maxtime)) %"
        }
        else
        {
            // khi duoc 100%
            currentTime = 0.0
            myTime?.invalidate()
            myTime = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressView?.setProgress(0.0, animated: true)
        labelPogress?.text = ""
    }


}

