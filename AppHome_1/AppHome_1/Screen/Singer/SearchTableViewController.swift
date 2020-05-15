//
//  SearchTableViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/16/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Speech

class SearchTableViewController: UITableViewController, UISearchResultsUpdating
{
    let cellID = "tableView"

    let searchController = UISearchController(searchResultsController: nil)
    
    var customerArray = [NSDictionary?]()
    var filtercustomer = [NSDictionary?]()
    
    var databaseRef = Database.database().reference()
    
//    var strSearch = ""
//    {
//        didSet
//        {
////            self.searchController.searchBar.text = self.strSearch
//            print("strSearch: \(strSearch)")
//        }
//    }
    
    var isSetHidden: Bool = false
    
    lazy var refreshControl1: UIRefreshControl =
    {
        let refesh = UIRefreshControl()
        refesh.tintColor = UIColor.lightGray
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        refesh.attributedTitle = NSAttributedString(string: "Tải thêm...", attributes: attributes)

        return refesh
    }()
    
    let microphoneButton: UIButton =
    {
       let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "iconMicro"), for: .normal)
        btn.backgroundColor = .white
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        
        return btn
    }()
    
    let viewAnimation: AnimationVoiceControllerViewController =
    {
       let v = AnimationVoiceControllerViewController()
//        v.translatesAutoresizingMaskIntoConstraints = false

        return v
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Danh sách khách nợ"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        
        searchController.searchBar.addSubview(microphoneButton)
        
        microphoneButton.frame = CGRect(x: CGFloat(16), y: CGFloat(16), width: CGFloat(20), height: CGFloat(20))
//        microphoneButton.anchor(top: nil, leading: searchController.searchBar.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0), size: .init(width: 25, height: 30))
//        microphoneButton.centerYAnchor.constraint(equalTo: searchController.searchBar.centerYAnchor).isActive = true
        microphoneButton.addTarget(self, action: #selector(openmic(_sender:)), for: .touchUpInside)
        
        
        
        
        searchController.searchBar.delegate = self
        
        
        self.tableView.separatorStyle = .none
        
        self.tableView.dataSource = self
        self.tableView.register(searchTabviewCell.self, forCellReuseIdentifier: cellID)
        
        handlerData()
        addRefeshControl()
        
        
    }
    
    
    @objc func openmic(_sender: Any)
    {
        
        print("open micro")
        let vc = AnimationVoiceControllerViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func handlerData()
    {
        databaseRef.child("customer").queryOrdered(byChild: "name").observe(.childAdded, with: {(snapshot) in
            
            self.customerArray.append(snapshot.value as? NSDictionary)
            
            // insert row
            self.tableView.insertRows(at: [IndexPath(row: self.customerArray.count - 1, section: 0)], with: UITableView.RowAnimation.automatic)
            
        }) {(error) in
            print(error.localizedDescription)
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController)
    {
        filterContent(searchText: self.searchController.searchBar.text!)
    }
    
    func filterContent(searchText: String)
    {
        self.filtercustomer = self.customerArray.filter{ customer in
            let customerName = customer!["name"] as? String
            
            return(customerName?.lowercased().contains(searchText.lowercased()))!
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! searchTabviewCell
        
        let custome: NSDictionary?
        
        if searchController.isActive && searchController.searchBar.text != ""
        {
            custome = filtercustomer[indexPath.row]
        }
        else
        {
            custome = self.customerArray[indexPath.row]
        }
        
        cell.numberDot.text = "\(indexPath.row + 1)"
        cell.lblCustomerName.text = custome?["name"] as? String
        cell.lblPhone.text = custome?["phone"] as? String
        cell.lblMonney.text = custome?["totalowe"] as? String
        cell.strPhoneNumBerPerSon = custome?["phone"] as! String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""
        {
            return filtercustomer.count
        }
        return self.customerArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let row = self.customerArray[indexPath.row]
        let vc = InforOweController()
        vc.title = "Chi tiết khách hàng"
        vc.data = row as? [String : AnyObject]
        if isSetHidden == true
        {
            vc.isCheckInfor = true
        }
        else
        {
            vc.isCheckInfor = false
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addRefeshControl()
    {
        // Add Refresh Control to collection view
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl1
        }
        else
        {
            self.tableView.addSubview(refreshControl1)
        }
        
        refreshControl1.addTarget(self, action: #selector(updateData), for: .valueChanged)
    }
    
    @objc private func updateData()
    {
        refreshControl1.endRefreshing()
        self.customerArray = []
        self.tableView.reloadData()
        handlerData()
    }
}




extension SearchTableViewController: UISearchBarDelegate, animationVoiceDelegate
{
    func voicetext(text: String) {
        self.searchController.searchBar.text = text
    }
    
   func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar)
   {
        print("click")
    
   }

}


























//MARK: TABLE CELL
class searchTabviewCell: baseTableViewCell
{
    let numberDotView: UIView =
    {
        let n = UIView()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.backgroundColor = colorebtnAdd
        n.contentMode = .scaleAspectFill
        n.clipsToBounds = true
        n.layer.cornerRadius = 15
        
        return n
    }()
    
    let numberDot: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblCustomeNameTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tên Khách :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblCustomerName: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nguyen Van A"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhoneTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "SĐT :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblPhone: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "07428123214"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonneyTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Số tiền :"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Bold", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonney: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "9000000"
        lbl.textAlignment = .left
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    var strPhoneNumBerPerSon: String = ""
    
    override func setupView()
    {
        super.setupView()
        
        makeBottomShadow(shadowOpacity: 1.0, shadowRadius: 1.0, radius: 5.0)
        backgroundColor = .white
        
        setupUI()
        
        layoutSubviews()
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        let margin = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margin)
    }
    
    func setupUI()
    {
        addSubview(numberDotView)
        numberDotView.addSubview(numberDot)
        addSubview(lblCustomeNameTitle)
        addSubview(lblCustomerName)
        addSubview(lblPhoneTitle)
        addSubview(lblPhone)
        addSubview(lblMonneyTitle)
        addSubview(lblMonney)
        
        numberDotView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: 30, height: 30))
        numberDot.centerXAnchor.constraint(equalTo: numberDotView.centerXAnchor).isActive = true
        numberDot.centerYAnchor.constraint(equalTo: numberDotView.centerYAnchor).isActive = true
        
        // ...........
        
        lblCustomeNameTitle.anchor(top: topAnchor, leading: numberDotView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: 100, height: 0))
        lblCustomerName.anchor(top: topAnchor, leading: lblCustomeNameTitle.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblCustomerName.centerYAnchor.constraint(equalTo: lblCustomeNameTitle.centerYAnchor).isActive = true
        
        //............
        
        lblPhoneTitle.anchor(top: lblCustomeNameTitle.bottomAnchor, leading: lblCustomeNameTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .zero)
        lblPhone.anchor(top: lblCustomerName.bottomAnchor, leading: lblCustomerName.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblPhone.centerYAnchor.constraint(equalTo: lblPhoneTitle.centerYAnchor).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openPhonePerSon(_:)))
        lblPhone.isUserInteractionEnabled = true
        lblPhone.addGestureRecognizer(gesture)
        
        //..................
        
        lblMonneyTitle.anchor(top: lblPhoneTitle.bottomAnchor, leading: lblPhoneTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .zero)
        lblMonney.anchor(top: lblPhone.bottomAnchor, leading: lblPhone.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        lblMonney.centerYAnchor.constraint(equalTo: lblMonneyTitle.centerYAnchor).isActive = true
    }
    
    @objc func openPhonePerSon(_ : UITapGestureRecognizer)
    {
        print("call Phone")
        //        UIApplication.sharedApplication().openURL(NSURL(string: "tel://1234567890"))
        UIApplication.shared.openURL(URL(string: "tel://\(String(describing: strPhoneNumBerPerSon))")!)
        print("strphone = \(strPhoneNumBerPerSon)")
    }
}
