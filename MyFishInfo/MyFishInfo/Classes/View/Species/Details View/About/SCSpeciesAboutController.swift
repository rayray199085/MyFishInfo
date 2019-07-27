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
    @IBOutlet var iconImageViews: [UIImageView]!
    @IBOutlet var titleLabels: [UILabel]!
    
    
    @IBOutlet weak var basicInfoCell: UITableViewCell!
    private lazy var imageScrollView = SCSpeciesImagesCollectionView.scrollImageView()
    var viewModel: SCSpeciesViewModel?{
        didSet{
            if (viewModel?.imageUrlStrings?.count ?? 0) > 0{
                imageScrollView.imageUrlStrings = viewModel?.imageUrlStrings
            }else{
                tableView.tableHeaderView = nil
            }
            
            for (index,str) in (viewModel?.basicInfoStrings ?? []).enumerated(){
                basicInfoLabels[index].text = str
            }
            let dictArray = (viewModel?.isFarmed ?? false) ? viewModel?.farmSpecies : viewModel?.wildSpecies
            for (index,dict) in (dictArray ?? []).enumerated(){
                guard let imageName = dict["image"] else{
                    continue
                }
                iconImageViews[index].image = UIImage(named: imageName)
                titleLabels[index].text = dict["title"]
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = imageScrollView
        tableView.separatorStyle = .none
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
