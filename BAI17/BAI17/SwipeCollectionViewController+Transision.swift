//
//  SwipeCollectionViewController+Transision.swift
//  BAI17
//
//  Created by Xuan Huy on 11/11/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//


import UIKit
extension SwipeCollectionViewController
{
    // goi khi size bi thay doi
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        coordinator.animate(alongsideTransition:
            { (_) in
            
                if(self.pageControl.currentPage == 0)
                {
                    self.collectionView?.contentOffset = .zero
                }
                else
                {
                    self.collectionViewLayout.invalidateLayout() //reset ve vi tri 0.0
                    let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                    self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
            }) { (_) in
                    // khong lam gi sau khi ket thuc ham animation
                }
    }
}
