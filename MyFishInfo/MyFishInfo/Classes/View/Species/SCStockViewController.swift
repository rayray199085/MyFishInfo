//
//  SCSpeciesViewController.swift
//  MyFinanceInfo
//
//  Created by Stephen Cao on 14/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCSpeciesViewController: UIViewController {
    private let listViewModel = SCSpeciesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
}
private extension SCSpeciesViewController{
    func loadData(){
        SVProgressHUD.show()
        listViewModel.loadSpeciesData { [weak self](isSuccess) in
            print(self?.listViewModel.speciesItems?.count ?? 0)
            SVProgressHUD.dismiss()
        }
    }
}
