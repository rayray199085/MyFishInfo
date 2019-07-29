//
//  SCFavouriteListViewModel.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

class SCFavouriteListViewModel {
    var viewModels: [SCSpeciesViewModel]?
    
    func loadDataFromDB(){
        let speciesItems = CoreDataManager.shared.getAllSpeciesItems()
        var viewModels = [SCSpeciesViewModel]()
        for item in speciesItems{
            guard let data = item.item,
                  let dataItem = try? JSONDecoder().decode(SCSpeciesDataItem.self, from: data) else{
                continue
            }
            viewModels.append(SCSpeciesViewModel(item: dataItem))
        }
        self.viewModels = viewModels
    }
}
