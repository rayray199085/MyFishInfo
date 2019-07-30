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
    private let displayView = SCRecipesDisplayView.displayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}
private extension SCRecipesViewController{
    func setupUI(){
        view.addSubview(displayView)
        displayView.delegate = self
    }
    func loadData(){
        listViewModel.loadRecipesListData { [weak self](isSuccess) in
            self?.displayView.meals = self?.listViewModel.meals
        }
    }
}
extension SCRecipesViewController: SCRecipesDisplayViewDelegate{
    func didSelectedCell(view: SCRecipesDisplayView, index: Int) {
        let vc = SCRecipesDetailsController()
        vc.title = listViewModel.meals?[index].strMeal
        listViewModel.loadRecipesMealDataWith(mealId: listViewModel.meals?[index].idMeal) { [weak self](isSuccess) in
            vc.viewModel = self?.listViewModel.viewModel
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
