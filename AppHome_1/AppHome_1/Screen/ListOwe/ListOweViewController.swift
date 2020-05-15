//
//  ListOweViewController.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/25/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class ListOweViewController: UIViewController
{
    
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refesh = UIRefreshControl()
        refesh.tintColor = UIColor.lightGray
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        refesh.attributedTitle = NSAttributedString(string: "Tải thêm...", attributes: attributes)
        
        return refesh
    }()
    
//    let searchBar: UISearchBar =
//    {
//        let s = UISearchBar()
//        s.translatesAutoresizingMaskIntoConstraints = false
//        s.placeholder = "Nhập tên khách bạn cần tìm"
//
//        return s
//    }()
    
    let collection: ListOweCollectionView =
    {
        let c = ListOweCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        c.translatesAutoresizingMaskIntoConstraints = false
//        c.backgroundColor = bgcolorHoSoRestaur
        
        return c
    }()
    //    var data: [Khach] = []
    var data: [customer] = [customer]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Danh sách nợ"
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = bgcolorHoSoRestaur
        
        setupView()
        handlerData()
        addRefeshControl()
//        updateSearchResults(for: searchController)
        
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.view.setNeedsLayout() // force update layout
        navigationController?.view.layoutIfNeeded() // to fix height of the navigation bar
    }
    func handlerData()
    {
//        self.data = khachData.share.khachList
//        collection.data = data
        data = [customer]()

        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef!.observe(.value, with: { snapshot in
            let dictRoot = snapshot.value as? [String: AnyObject] ?? [:]
            let dictCustomer = dictRoot["customer"] as? [String: AnyObject] ?? [:]
            for key in Array(dictCustomer.keys).sorted().reversed()
            {
                self.data.append(customer(dictionary: dictCustomer[key] as! [String: AnyObject], key: key))
            }
            var d: [[String: AnyObject]] = []
            for (_, val) in dictCustomer {
                if let val = val as? [String: AnyObject]
                {
                    if Int(val["totalowe"] as? String ?? "0") ?? 0 > 0
                    {
                        d.append(val)
                    }
                }
            }
            if d.count > 0 {
                self.collection.data = d
                print("d: ===== \(d)")
            } else {
                print("d is null")
            }
            self.collection.reloadData()
            print("dictCustomer: \(dictCustomer)")
            print("dicroot: \(dictRoot)")
        })
        
    }
    
    fileprivate func setupView()
    {
//        view.addSubview(searchBar)
        view.addSubview(collection)
//
//        searchBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 45))
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContent(searchText: self.searchBar.text!)
//    }
//
//    func filterContent(searchText: String)
//    {
//        data = [customer]()
//
//        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef!.child("customer").queryOrdered(byChild:  "name").queryStarting(atValue: searchText).queryEnding(atValue: searchText + "\u{f8ff}").observeSingleEvent(of: .value, with: { res in
//
//          print("snapshot respone: \(res)")
//             var d: [[String: AnyObject]] = []
//             if let v = res.value as? [String: AnyObject] {
//                 for (_, val) in v {
//                     if let val = val as? [String: AnyObject] {
//                         d.append(val)
//                     }
//                 }
//                 if d.count > 0 {
//                    self.collection.data = d
//                    self.collection.reloadData()
//                 } else {
//                     print("d is null")
//                 }
//             }
//
//        })
//
//
//    }
    
    func addRefeshControl()
    {
        // Add Refresh Control to collection view
        if #available(iOS 10.0, *) {
            self.collection.refreshControl = refreshControl
        }
        else
        {
            self.collection.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
    }
    
    @objc private func updateData()
    {
        refreshControl.endRefreshing()
        self.collection.data = []
        self.collection.reloadData()
        handlerData()
    }

}
