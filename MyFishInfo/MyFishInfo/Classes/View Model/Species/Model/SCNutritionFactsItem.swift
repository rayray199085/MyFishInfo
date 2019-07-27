//
//  SCNutritionFactsItem.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCNutritionFactsItem {
    let keyName: String
    let description: String
    init(keyName: String, description: String?) {
        self.keyName = keyName
        self.description = description ?? ""
    }
}
