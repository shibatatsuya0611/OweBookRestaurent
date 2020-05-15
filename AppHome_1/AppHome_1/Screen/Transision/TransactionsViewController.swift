//
//  TransactionsViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/27/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController
{

    lazy var refreshControl: UIRefreshControl = {
        let refesh = UIRefreshControl()
        refesh.tintColor = UIColor.lightGray
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        refesh.attributedTitle = NSAttributedString(string: "Tải thêm...", attributes: attributes)
        
        return refesh
    }()
    
    let topview: UIView =
    {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    let lblTotalOwe: UILabel =
    {
       let lbl = UILabel()
       lbl.translatesAutoresizingMaskIntoConstraints = false
       lbl.text = " Tổng số nợ"
       lbl.textAlignment = .center
       lbl.textColor = UIColor(hex: "333333")
       lbl.font = UIFont(name: "Roboto-Bold", size: fontSize30)
       
       return lbl
    }()
    
    let viewNumberTotalOwe: UIView =
    {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = colorebtnAdd
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 25
        
        return v
    }()
    
    let lblNumberTotal: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        
        return lbl
    }()
    
    let lblSumOwe: UILabel =
    {
       let lbl = UILabel()
       lbl.translatesAutoresizingMaskIntoConstraints = false
       lbl.text = "Tổng 10 mã"
       lbl.textAlignment = .center
       lbl.textColor = UIColor(hex: "333333")
       lbl.font = UIFont(name: "Roboto-Regular", size: fontSize13)
       
       return lbl
    }()
    
    let collection: ListOweCollectionView =
    {
        let coll = ListOweCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        coll.translatesAutoresizingMaskIntoConstraints = false
//        coll.backgroundColor = .white
        coll.isSetHidden = true
        
        return coll
    }()
    
    
//    var data: [Khach] = []
    var data: [customer] = [customer]()
    var totalMonney: Int = 0
    {
        didSet
        {
            print("total monney = \(totalMonney)")
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = bgcolorHoSoRestaur
        self.navigationController?.isNavigationBarHidden = false
        
        hideKeyBoardWhenTapAround()
        
        setupView()
        handlerdata()
        addRefeshControl()
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
    
    func handlerdata()
    {
//        self.data = khachData.share.khachList
//        collection.data = self.data
//        lblSumOwe.text = "Tổng hiện tại: " + "\(data.count)" + " mã nợ"
//        self.lblNumberTotal.text = "\(totalMonney)"
        var toal:Int = 0
//        for val in khachData.share.khachList
//        {
//            toal += val.oweMonney
//        }
//        self.lblNumberTotal.text = "\(toal)"
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
                                toal += Int(val["totalowe"] as? String ?? "0") ?? 0
                                print("total Toal: \(toal)")
                                self.lblNumberTotal.text = "\(toal)"
                            }
//                            d.append(val)
//                            toal += Int(val["totalowe"] as? String ?? "0") ?? 0
//                            print("total Toal: \(toal)")
//                            self.lblNumberTotal.text = "\(toal)"
                        }
                    }
                    if d.count > 0 {
                        self.collection.data = d
                        print("d: ===== \(d)")
                        self.lblSumOwe.text = "Tổng hiện tại: " + "\(d.count)" + " mã nợ"
                    } else {
                        print("d is null")
                    }
        //            self.collection.data = [dictCustomer]
                    self.collection.reloadData()
                    print("dictCustomer: \(dictCustomer)")
                    print("dicroot: \(dictRoot)")
                })
    }
    
    fileprivate func setupView()
    {
        view.addSubview(topview)
        topview.addSubview(lblTotalOwe)
        topview.addSubview(viewNumberTotalOwe)
        viewNumberTotalOwe.addSubview(lblNumberTotal)
        
        topview.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 150))
        topview.makeBottomShadow(shadowOpacity: 1.0, shadowRadius: 1.0, radius: 5.0)
        
        lblTotalOwe.anchor(top: topview.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .zero)
        lblTotalOwe.centerXAnchor.constraint(equalTo: topview.centerXAnchor).isActive = true
        
        viewNumberTotalOwe.anchor(top: lblTotalOwe.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 50))
        viewNumberTotalOwe.centerXAnchor.constraint(equalTo: topview.centerXAnchor).isActive = true
        
        lblNumberTotal.centerXAnchor.constraint(equalTo: viewNumberTotalOwe.centerXAnchor).isActive = true
        lblNumberTotal.centerYAnchor.constraint(equalTo: viewNumberTotalOwe.centerYAnchor).isActive = true
        
        view.addSubview(lblSumOwe)
        
        lblSumOwe.anchor(top: topview.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 10), size: .zero)
        
        view.addSubview(collection)
        collection.anchor(top: lblSumOwe.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .zero)
    }
    
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
        self.collection.total = 0
        handlerdata()
    }
}
