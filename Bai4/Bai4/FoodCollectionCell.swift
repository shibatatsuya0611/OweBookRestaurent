//
//  FoodCollectionCellCollectionViewCell.swift
//  Bai4
//
//  Created by Xuan Huy on 11/5/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class FoodCollectionCell: UICollectionViewCell
{
    
    var stackView: UIStackView = UIStackView()
    var imageView: UIImageView = UIImageView()
    var labelFoodName: UILabel = UILabel()
    var labelFoodDescription: UILabel = UILabel()
    
    func autolayoutCell()
    {
        self.backgroundColor = .white
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // autolayout imageView
        stackView.addArrangedSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "tohka.jpeg")
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        
        // autolayout labelFoodName
        labelFoodName.translatesAutoresizingMaskIntoConstraints = false
        labelFoodName.text = "Food name"
        labelFoodName.font = UIFont.boldSystemFont(ofSize: 15)
        stackView.addArrangedSubview(labelFoodName)
        
        // autolayout labelFoodDescription
        labelFoodDescription.translatesAutoresizingMaskIntoConstraints = false
        labelFoodDescription.text = "Food description"
        labelFoodDescription.font = UIFont.systemFont(ofSize: 15)
        stackView.addArrangedSubview(labelFoodDescription)
        
        // stackview setting
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        print("translate")
    }
    var food: Food!
    {
        didSet
        {
           // imageView.image = UIImage(named: food.imageName!)
            imageView.getImageFromURL(urlString: food.imageURL ?? "")
            labelFoodName.text = food.foodName ?? ""
            labelFoodDescription.text = food.foodDescription ?? ""
        }
    
    }
}
