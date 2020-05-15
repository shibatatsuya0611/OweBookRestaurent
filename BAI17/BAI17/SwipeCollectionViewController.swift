//
//  SwipeCollectionViewController.swift
//  BAI17
//
//  Created by Xuan Huy on 11/11/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

 let reuseIdentifier = "PageCellID"

class SwipeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var pageModels =
        [
            PageModel(image:#imageLiteral(resourceName: "tohka") , headerText: "Well Come"),
            PageModel(image:#imageLiteral(resourceName: "tohka1") , headerText: "Oh ! Tohka"),
            PageModel(image:#imageLiteral(resourceName: "myuky1") , headerText: "oh! mIYUKY"),
            PageModel(image:#imageLiteral(resourceName: "tohka3") , headerText: "oH! Oh!"),
            PageModel(image:#imageLiteral(resourceName: "tohka2") , headerText: "Tohka sword"),
        ]
    let previousButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    @objc func handlePrevious(sender: Any)
    {
        let preveousIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: preveousIndex, section: 0)
        pageControl.currentPage = preveousIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
   lazy var pageControl: UIPageControl =
    {
        let _pageControl = UIPageControl()
        _pageControl.translatesAutoresizingMaskIntoConstraints = false
        _pageControl.currentPage = 0
        _pageControl.numberOfPages = pageModels.count
        _pageControl.currentPageIndicatorTintColor = .red
        _pageControl.pageIndicatorTintColor = .lightGray
        return _pageControl
    }()
    let NextButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext(sender: Any)
    {
        let nextIndex = min(pageControl.currentPage + 1, pageModels.count - 1)
               let indexPath = IndexPath(item: nextIndex, section: 0)
               pageControl.currentPage = nextIndex
               collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    fileprivate func layoutButtomButons()
    {
        view.addSubview(previousButton)
        view.addSubview(pageControl)
        view.addSubview(NextButton)
        let bottomStackView = UIStackView(arrangedSubviews:  [previousButton,pageControl,NextButton])
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        bottomStackView.distribution = .fillEqually
        bottomStackView.axis = .horizontal
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.register(PageCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
        layoutButtomButons()

        // Do any additional setup after loading the view.
    }
    
    
}

