//
//  SCRecipesMealCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCRecipesMealCell: UITableViewCell {
    var ingredient: SCRecipesIngredient?{
        didSet{
            ingredientNameLabel.text = ingredient?.name
            ingredientQuantityLabel.text = ingredient?.quantity
        }
    }

    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var ingredientQuantityLabel: UILabel!
    
}
