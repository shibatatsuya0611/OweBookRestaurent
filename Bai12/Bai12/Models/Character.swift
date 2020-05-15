//
//  Character.swift
//  Bai12
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit
class Character
{
    var imageName: String?
    var image: UIImage?
    var CharacterName: String?
    var rating: Int?
    var description: String?
    convenience init(imageName: String, CharacterName: String, rating: Int, description: String)
    {
        self.init()
        self.imageName = imageName
        self.CharacterName = CharacterName
        self.rating = rating
        self.description = description
    }
}
