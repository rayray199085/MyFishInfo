//
//  SCSpeciesHealthController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "health_cell"
class SCSpeciesHealthController: UIViewController {
    private var headerView: SCSpeciesHealthHeaderView?
    
    var viewModel: SCSpeciesViewModel?{
        didSet{
            tableView.reloadData()
            if headerView == nil && viewModel?.showHealthHeaderView == true{
                headerView = SCSpeciesHealthHeaderView.headerView(height: viewModel?.healthHeaderViewHeight ?? 0)
                headerView?.tasteStrings = viewModel?.tasteStrings
                tableView.tableHeaderView = headerView
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SCSpeciesHealthCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
extension SCSpeciesHealthController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.nutritionFactsItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCSpeciesHealthCell
        cell.nutritionFactItem = viewModel?.nutritionFactsItems?[indexPath.row]
        return cell
    }
}
