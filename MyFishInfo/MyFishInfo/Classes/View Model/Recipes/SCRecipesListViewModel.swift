//
//  SCRecipesListViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class SCRecipesListViewModel{
    func loadRecipesListData(completion: @escaping (_ isSuccess: Bool)->()){
        SCNetworkManager.shared.getRecipesListData { (data, isSuccess) in
            guard let path = Bundle.main.path(forResource: "recipes", ofType: "json"),
                let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
                let recipesData = try? JSONDecoder().decode(SCRecipesData.self, from: data) else{
                    completion(false)
                    return
            }
            print(NSString.getDocumentDirectory())
            completion(true)
        }
    }
}
