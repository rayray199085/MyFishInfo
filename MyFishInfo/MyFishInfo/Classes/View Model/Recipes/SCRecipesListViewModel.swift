//
//  SCRecipesListViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class SCRecipesListViewModel{
    var meals: [SCRecipesDataItem]?
    var viewModel: SCRecipesViewModel?
    
    func loadRecipesListData(completion: @escaping (_ isSuccess: Bool)->()){
        guard let path = Bundle.main.path(forResource: "recipes", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let recipesData = try? JSONDecoder().decode(SCRecipesData.self, from: data) else{
                completion(false)
                return
        }
        self.meals = recipesData.meals
        completion(true)
    }
    func loadRecipesMealDataWith(mealId: String?, completion: @escaping (_ isSuccess: Bool)->()){
        guard let mealId = mealId,
              let path = Bundle.main.path(forResource: mealId, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let mealData = try? JSONDecoder().decode(SCRecipesMealData.self, from: data),
              let mealItem = mealData.meals?[0] else{
            completion(false)
            return
        }
        viewModel = SCRecipesViewModel(item: mealItem)
        completion(true)
    }
}
