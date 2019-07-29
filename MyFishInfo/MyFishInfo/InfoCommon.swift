//
//  InfoCommon.swift
//  MyFinanceInfo
//
//  Created by Stephen Cao on 14/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct InfoCommon{
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }()
    static let regionKey = "region"
    //#21529A
    static let tinColor = UIColor(displayP3Red: 33.0 / 250, green: 82.0 / 250, blue: 154.0 / 250, alpha: 1.0)
    static let barColor = UIColor(displayP3Red: 192.0 / 250, green: 192.0 / 250, blue: 192.0 / 250, alpha: 1.0)
    static let tabbarNormalColor = UIColor(displayP3Red: 128.0 / 250, green: 128.0 / 250, blue: 128.0 / 250, alpha: 1.0)
    static let navHighlightedColor = UIColor(displayP3Red: 68.0 / 250, green: 68.0 / 250, blue: 68.0 / 250, alpha: 1.0)
    static let increasingPriceColor = UIColor(displayP3Red: 83.0 / 250, green: 164.0 / 250, blue: 81.0 / 250, alpha: 1.0)
    static let decreasingPriceColor = UIColor(displayP3Red: 189.0 / 250, green: 63.0 / 250, blue: 68.0 / 250, alpha: 1.0)
    
    static let baseUrl = "https://www.fishwatch.gov/api/species"
    static let recipesUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"
    static let mealUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php"
    static let SCUpdateFavouriteSpecies = "SCUpdateFavouriteSpecies"
}
