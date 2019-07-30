//
//  SCRecipesViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCRecipesViewModel {
    var mealName: String?
    var videoUrl: URL?
    var ingredients: [SCRecipesIngredient]?
    var instructions: String?
    var instructionViewHeight: CGFloat?
    
    init(item: SCRecipesMealDataItem) {
        mealName = item.strMeal
        if let urlString = item.strYoutube,
            let url = URL(string: urlString){
            videoUrl = url
        }
        let ingredientNames = [item.strIngredient1,item.strIngredient2,item.strIngredient3
        ,item.strIngredient4,item.strIngredient5,item.strIngredient6,item.strIngredient7
        ,item.strIngredient8,item.strIngredient9,item.strIngredient10,item.strIngredient11
        ,item.strIngredient12,item.strIngredient13,item.strIngredient14,
         item.strIngredient15,item.strIngredient16,
         item.strIngredient17,item.strIngredient18,item.strIngredient19,
        item.strIngredient20]
        let ingredientQuantityList = [item.strMeasure1,item.strMeasure2,item.strMeasure3,
        item.strMeasure4,item.strMeasure5,item.strMeasure6,
        item.strMeasure7,item.strMeasure8,item.strMeasure9,item.strMeasure10,
        item.strMeasure11,item.strMeasure12,item.strMeasure13,
        item.strMeasure14,item.strMeasure15,item.strMeasure16,
        item.strMeasure17,item.strMeasure18,item.strMeasure19,item.strMeasure20]
        
        var ingredients = [SCRecipesIngredient]()
        for (index,ingredientName) in ingredientNames.enumerated(){
            if ingredientName != nil && (ingredientName?.count ?? 0) > 0{
                ingredients.append(SCRecipesIngredient(name: ingredientName, quantity: ingredientQuantityList[index]))
            }
        }
        self.ingredients = ingredients
        instructions = item.strInstructions
        instructionViewHeight = calculateInstructionViewHeight()
    }
    func calculateInstructionViewHeight()->CGFloat{
        let margin: CGFloat = 3
        let viewWidth = UIScreen.screenWidth() - margin * 2
        var height = margin
        height += instructions?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 15)) ?? 0
        height += margin
        return height
    }
}
struct SCRecipesIngredient{
    let name: String
    let quantity: String
    init(name: String?, quantity: String?) {
        self.name = name ?? ""
        self.quantity = quantity ?? ""
    }
}
