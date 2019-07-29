//
//  SCFavouriteViewController.swift
//  MyFinanceInfo
//
//  Created by Stephen Cao on 14/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCFavouriteViewController: UIViewController {
    private let displayView = SCFavouriteDisplayView.displayView()
    private let listViewModel = SCFavouriteListViewModel()
    var shouldReloadData = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        NotificationCenter.default.addObserver(self, selector: #selector(handleUpdateFavouriteSpecies), name: NSNotification.Name(InfoCommon.SCUpdateFavouriteSpecies), object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(InfoCommon.SCUpdateFavouriteSpecies), object: nil)
    }
    @objc private func handleUpdateFavouriteSpecies(){
        shouldReloadData = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if shouldReloadData{
            loadData()
            shouldReloadData = false
        }
    }
}
extension SCFavouriteViewController{
    func setupUI(){
        view.addSubview(displayView)
        displayView.delegate = self
    }
    func loadData(){
        listViewModel.loadDataFromDB()
        displayView.viewModels = listViewModel.viewModels
    }
}
extension SCFavouriteViewController: SCFavouriteDisplayViewDelegate{
    func didSelectedCell(view: SCFavouriteDisplayView, index: Int) {
        let vc = SCSpeciesDetailsController()
        vc.viewModel = listViewModel.viewModels?[index]
        vc.title = listViewModel.viewModels?[index].speciesName
        navigationController?.pushViewController(vc, animated: true)
    }
}

