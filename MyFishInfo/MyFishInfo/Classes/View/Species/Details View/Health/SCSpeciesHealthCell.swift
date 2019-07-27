//
//  SCSpeciesHealthCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCSpeciesHealthCell: UITableViewCell {
    var nutritionFactItem: SCNutritionFactsItem?{
        didSet{
            rowNameLabel.text = nutritionFactItem?.keyName
            valueLabel.text = nutritionFactItem?.description
        }
    }
    
    @IBOutlet weak var rowNameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
}
