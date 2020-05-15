//
//  CharacterTableViewCell.swift
//  Bai12
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewChar: UIImageView?
    @IBOutlet weak var lblCharName: UILabel?
    @IBOutlet weak var lblrating: UILabel?
    @IBOutlet weak var lbldescription: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
