//
//  SCSpeciesListViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 25/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class SCSpeciesListViewModel{
    var speciesItems: [SCSpeciesDataItem]?
    
    func loadSpeciesData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let path = Bundle.main.path(forResource: "species", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),let speciesItems = try? JSONDecoder().decode([SCSpeciesDataItem].self, from: data) else{
                completion(false)
                return
        }
        self.speciesItems = speciesItems
        completion(true)
    }
}
