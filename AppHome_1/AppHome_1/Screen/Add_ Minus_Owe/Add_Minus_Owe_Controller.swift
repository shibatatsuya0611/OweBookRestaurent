//
//  Add_Minus_Owe_Controller.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/27/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit

class Add_Minus_Owe_Controller: UIViewController
{

    let mainScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        return view
    }()
    
    let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        
        return v
    }()
    
    let topview: AddNewOwe =
    {
       let v = AddNewOwe()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.isChecked = 0
        
        return v
    }()
    
    let lblnoteTitle: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nhập số tiền muốn thêm hoặc trừ nợ cho khách"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        
        return lbl
    }()
    
    let lblMonneyNeed: PHTextField =
    {
        let lbl = PHTextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.placeholder = "Nhập số tiền"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize16)
        lbl.keyboardType = UIKeyboardType.numberPad
        
        return lbl
    }()
    
    let btnAddOwe: UIButton =
    {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Thêm Nợ", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        btn.backgroundColor = colorBtnEdit
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        
        return btn
    }()
    
    let btnMinusOwe: UIButton =
    {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Trừ nợ", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Bold", size: fontSize18)
        btn.backgroundColor = colorBtnEdit
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        
        return btn
    }()
    
    
    fileprivate let constant: CGFloat = 32
    fileprivate var constantMarginTop: CGFloat!
    var heightConstraintContainerView: NSLayoutConstraint?
    
        
    var numberSum: Int = 0
    var MonneyData: Int = 0
    {
        didSet
        {
            print("monney hien tai: \(MonneyData)")
        }
    }
    var data: [String: AnyObject] = [:]
    {
        didSet
        {
            self.topview.data = data
            self.MonneyData = Int(data["totalowe"] as? String ?? "0") ?? 0
        }
    }

    
    //MARK: VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        
        view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        hideKeyBoardWhenTapAround()
        
        setupView()
        prepareBtn()
        
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

    fileprivate func setupView()
    {
        constantMarginTop = DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6_8 ? self.view.frame.width / 4 : self.view.frame.width / 3.5
        mainScrollView.addSubview(containerView)
        containerView.anchor(top: mainScrollView.topAnchor, leading: mainScrollView.leadingAnchor, bottom: mainScrollView.bottomAnchor, trailing: mainScrollView.trailingAnchor, padding: .zero, size: .init(width: self.view.frame.width, height: 0))
        heightConstraintContainerView = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: caculateHeightConstraint())
        mainScrollView.addConstraint(heightConstraintContainerView!)
        
        containerView.addSubview(topview)
        containerView.addSubview(lblnoteTitle)
        containerView.addSubview(lblMonneyNeed)
        containerView.addSubview(btnAddOwe)
        containerView.addSubview(btnMinusOwe)
        
        topview.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 400))
        topview.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        
        lblnoteTitle.anchor(top: topview.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 5, bottom: 0, right: 5), size: .zero)
        lblMonneyNeed.anchor(top: lblnoteTitle.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 5, bottom: 0, right: 5), size: .init(width: self.containerView.frame.width, height: 50))
        lblMonneyNeed.addBorderWithContraint(color: colorTextField, bottomHeight: 1, rightWidth: 0, leftWidth: 0, topHeight: 0)
        btnAddOwe.anchor(top: lblMonneyNeed.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.centerXAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        btnMinusOwe.anchor(top: lblMonneyNeed.bottomAnchor, leading: containerView.centerXAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        
    }
    
    
    fileprivate func prepareBtn()
    {
        
        btnAddOwe.addTarget(self, action: #selector(addOwe(_:)), for: .touchUpInside)
        
        btnMinusOwe.addTarget(self, action: #selector(MinusOwe(_:)), for: .touchUpInside)
    }
    
    
    
    //MARK: Function
    
    @objc func addOwe(_ sender: UIButton)
    {
        self.numberSum = Int(lblMonneyNeed.text ?? "0") ?? 0
        print("numbersum: \(numberSum)")
        var sumOwe: Int = 0
        if MonneyData + numberSum < 0
        {
            print("dont use")
        }
        else
        {
            sumOwe = MonneyData + numberSum
            
            print("sau khi tinh tong: \(sumOwe)")
            print("add Owe")
            let alert = UIAlertController(title: "Chú ý", message: "Bạn có chắc chắn muốn thêm nợ \n" + "\(numberSum) \n" + " cho khách hàng này ?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: { action in
                switch action.style{
                case .default:
                    print("Đã huy")
                    

                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")
                @unknown default:
                    break
                }
            }))
            alert.addAction(UIAlertAction(title: "Đồng ý", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("Đã thêm")
//                    self.data.oweMonney = sumOwe
//                    print("thay doi thanh : \(self.data.oweMonney)")
//                    self.navigationController?.popViewController(animated: true)
                    print("deletename: \(self.data["name"] as? String ?? "")")
                    (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child(self.data["name"] as! String).removeValue()
                    // then .. Insert
                    (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child((self.data["name"] as? String)!).setValue(["name": self.data["name"] as? String, "address": self.data["address"] as? String, "date": self.data["date"] as? String, "note": self.data["note"] as? String, "phone": self.data["phone"] as? String, "totalowe": "\(sumOwe)"])
                    self.navigationController?.popToRootViewController(animated: true)
                    self.view.makeToast("Đã thêm !")
                    
                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")
                @unknown default:
                    break
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func MinusOwe(_ sender: UIButton)
    {
        self.numberSum = Int(lblMonneyNeed.text ?? "0") ?? 0
        print("numbersum: \(numberSum)")
        var sumOwe: Int = 0
        if MonneyData - numberSum < 0
        {
            print("dont use")
            let alert = UIAlertController(title: "Chú ý", message: "Số tiền muốn trừ vượt quá số nợ ban đầu !", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("Đã Huy")

                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")
                @unknown default:
                    break
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            sumOwe = MonneyData - numberSum
            print("sau khi tinh tong: \(sumOwe)")
            
            print("Minus Owe")
            let alert = UIAlertController(title: "Chú ý", message: "Bạn có chắc chắn muốn trừ nợ \n" + "\(numberSum) \n" + " cho khách hàng này ?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: { action in
                switch action.style{
                case .default:
                    print("Đã thêm")

                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")
                @unknown default:
                    break
                }
            }))
            alert.addAction(UIAlertAction(title: "Đồng ý", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("Đã trừ")
                    
//                    self.data.oweMonney = sumOwe
//                    print("thay doi thanh : \(self.data.oweMonney)")
//                    self.navigationController?.popViewController(animated: true)
                    (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child(self.data["name"] as! String).removeValue()
                    // then .. Insert
                    (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.child("customer").child((self.data["name"] as? String)!).setValue(["name": self.data["name"] as? String, "address": self.data["address"] as? String, "date": self.data["date"] as? String, "note": self.data["note"] as? String, "phone": self.data["phone"] as? String, "totalowe": "\(sumOwe)"])
                    self.navigationController?.popToRootViewController(animated: true)
                    self.view.makeToast("Đã trừ !")

                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")
                @unknown default:
                    break
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    fileprivate func caculateHeightConstraint() -> CGFloat
    {
        let heightStatusBar = UIApplication.shared.statusBarFrame.height
        let heightTabBar = self.tabBarController?.tabBar.frame.height ?? 0
        let heightNavBar = self.navigationController?.navigationBar.frame.height ?? 0
        let heightView = self.view.frame.height - heightTabBar - heightStatusBar - heightNavBar
        let heightConstant = constant * 2
        
        let currentHeight: CGFloat = constantMarginTop + 290 + heightConstant + 250 + 100
        
        if currentHeight > heightView {
            return currentHeight
        }
        else
        {
            return heightView
        }
    }
}
