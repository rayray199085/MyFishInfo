//
//  SCSpeciesAboutController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCSpeciesAboutController: UITableViewController {
    @IBOutlet var basicInfoLabels: [UILabel]!
    
    
    @IBOutlet weak var basicInfoCell: UITableViewCell!
    private lazy var imageScrollView = SCSpeciesImagesCollectionView.scrollImageView()
    var viewModel: SCSpeciesViewModel?{
        didSet{
            imageScrollView.imageUrlStrings = viewModel?.imageUrlStrings
            for (index,str) in (viewModel?.basicInfoStrings ?? []).enumerated(){
                basicInfoLabels[index].text = str
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = imageScrollView
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.aboutCellHeight ?? 0
    }
}
