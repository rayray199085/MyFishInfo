//
//  SCRecipesCollectionViewCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCRecipesCollectionViewCell: UICollectionViewCell {
    
    var item: SCRecipesDataItem?{
        didSet{
            if let imageName = item?.idMeal{
                mealImageView.image = UIImage(named: imageName)
            }
            mealNameLabel.text = item?.strMeal
        }
    }
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    
}
