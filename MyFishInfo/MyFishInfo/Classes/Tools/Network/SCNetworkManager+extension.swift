//
//  SCNetworkManager+extension.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 25/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import Alamofire

extension SCNetworkManager{
    func getSpeciesData(completion:@escaping (_ data: Data?, _ isSuccess: Bool)->()){
        request(urlString: InfoCommon.baseUrl, method: HTTPMethod.get, params: nil) { (data, _, isSuccess, _, _) in
            completion(data, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getRecipesListData(completion:@escaping (_ data: Data?, _ isSuccess: Bool)->()){
        request(urlString: InfoCommon.recipesUrl, method: HTTPMethod.get, params: nil) { (data, _, isSuccess, _, _) in
            completion(data, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getRecipesMealData(idMeal: String,completion:@escaping (_ data: Data?, _ isSuccess: Bool)->()){
        let params = ["i": idMeal]
        request(urlString: InfoCommon.mealUrl, method: HTTPMethod.get, params: params) { (data, _, isSuccess, _, _) in
            completion(data, isSuccess)
        }
    }
}
