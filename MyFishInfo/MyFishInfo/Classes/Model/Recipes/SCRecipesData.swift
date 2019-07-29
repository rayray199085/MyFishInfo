//
//  SCRecipesData.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCRecipesData: Codable {
    let meals: [SCRecipesDataItem]?
}

struct SCRecipesDataItem: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
