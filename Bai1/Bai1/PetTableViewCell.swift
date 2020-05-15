//
//  PetTableViewCell.swift
//  Bai1
//
//  Created by Xuan Huy on 11/2/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var lableTitle: UILabel!
    var pet: Pet!
    {
        didSet {
            labelName.text = pet.name
            lableTitle.text = pet.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
