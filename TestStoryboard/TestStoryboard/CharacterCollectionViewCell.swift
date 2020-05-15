//
//  CharacterCollectionViewCell.swift
//  TestStoryboard
//
//  Created by Xuan Huy on 11/19/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    
    var chars: Characters!
    {
        didSet
        {
            imageView?.image = UIImage(named: chars.imageName!)
        }
    }
}
