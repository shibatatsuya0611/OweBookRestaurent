//
//  notificaController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 12/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class notificaController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource
{
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Thong Bao"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
               navigationController?.navigationBar.titleTextAttributes = textAttributes
//        view.backgroundColor = .white
        autolayoutUI()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(notificationTableCell.self, forCellReuseIdentifier: "tableCell")
        
    }
    func autolayoutUI()
    {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        tableView.rowHeight = 85
//        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = .white
                 //collectionview setting
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! notificationTableCell
        
        
        cell.autolayoutUICell()
        
        return cell
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {

         if(velocity.y > 0)
         {

            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions(), animations: {
                 self.navigationController?.setNavigationBarHidden(true, animated: true)
               
             }, completion: nil)

         }
         else
         {
            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions(), animations: {
                 self.navigationController?.setNavigationBarHidden(false, animated: true)
                
             }, completion: nil)
        }
    }
}
