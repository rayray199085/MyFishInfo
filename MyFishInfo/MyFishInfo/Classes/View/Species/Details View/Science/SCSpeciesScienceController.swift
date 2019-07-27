//
//  SCSpeciesScienceController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

private let reuseIdenfier = "science_cell"
class SCSpeciesScienceController: UIViewController {
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
        
        tableView.register(UINib(nibName: "SCSpeciesScienceCell", bundle: nil), forCellReuseIdentifier: reuseIdenfier)
    }
}
extension SCSpeciesScienceController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.scienceItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdenfier, for: indexPath) as! SCSpeciesScienceCell
        cell.scienceItem = viewModel?.scienceItems?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.scienceItems?[indexPath.row].rowHeight ?? 0
    }
    
}
