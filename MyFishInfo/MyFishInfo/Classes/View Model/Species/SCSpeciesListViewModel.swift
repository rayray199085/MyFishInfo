//
//  SCSpeciesListViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 25/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class SCSpeciesListViewModel{
    var viewModels: [SCSpeciesViewModel]?
    var speciesName: [String]?
    
    func loadSpeciesData(completion: @escaping (_ isSuccess: Bool)->()){
        
        var names = [String]()
        var tempViewModels = [SCSpeciesViewModel]()
        
        DispatchQueue.global().async {
            if let path = Bundle.main.path(forResource: "species", ofType: "json"),
               let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
               var speciesItems = try? JSONDecoder().decode([SCSpeciesDataItem].self, from: data){
                speciesItems.sort(by: {($0.speciesName ?? "") < ($1.speciesName ?? "")})
                var speciesName = [String]()
                var viewModels = [SCSpeciesViewModel]()
                for item in speciesItems{
                    speciesName.append(item.speciesName ?? "")
                    viewModels.append(SCSpeciesViewModel(item: item))
                }
                names = speciesName
                tempViewModels = viewModels
            }
            
            DispatchQueue.main.async(execute: {
                self.viewModels = tempViewModels
                self.speciesName = names
                completion(true)
            })
        }
    }
}
