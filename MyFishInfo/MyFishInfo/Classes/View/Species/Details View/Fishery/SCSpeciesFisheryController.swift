//
//  SCSpeciesFisheryController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 28/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
private let reuseIdentifier = "fishery_cell"
class SCSpeciesFisheryController: UIViewController {
    var viewModel: SCSpeciesViewModel?{
        didSet{
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SCSpeciesScienceCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
extension SCSpeciesFisheryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.fisheryItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCSpeciesScienceCell
        cell.scienceItem = viewModel?.fisheryItems?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.fisheryItems?[indexPath.row].rowHeight ?? 0
    }
}
