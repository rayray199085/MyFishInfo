//
//  SCRecipesViewController.swift
//  MyFinanceInfo
//
//  Created by Stephen Cao on 14/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCRecipesViewController: UIViewController {
    private let listViewModel = SCRecipesListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel.loadRecipesListData { (isSuccess) in
            
        }
    }
}
