//
//  SCSpeciesDisplayView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import SCTableIndex
protocol SCSpeciesDisplayViewDelegate: NSObjectProtocol {
    func didTapImageView(view: SCSpeciesDisplayView, urlString: String)
    func didSelectedCell(view: SCSpeciesDisplayView, index: Int)
}
private let reuseIdentifier = "species_cell"
class SCSpeciesDisplayView: UIView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableIndex: SCTableIndex!
    weak var delegate: SCSpeciesDisplayViewDelegate?
    
    var viewModels: [SCSpeciesViewModel]?{
        didSet{
            tableView.reloadData()
        }
    }
    
    class func displayView()->SCSpeciesDisplayView{
        let nib = UINib(nibName: "SCSpeciesDisplayView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCSpeciesDisplayView
        v.frame = UIScreen.main.bounds
        return v
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCSpeciesViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        tableIndex.delegate = self
        tableIndex.initialFont = UIFont.boldSystemFont(ofSize: 13)
        tableIndex.initialTextColor = InfoCommon.tinColor
    }
}
extension SCSpeciesDisplayView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModels?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCSpeciesViewCell
        cell.viewModel = viewModels?[indexPath.row]
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModels?[indexPath.row].displayCellRowHeight ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectedCell(view: self, index: indexPath.row)
    }
}
extension SCSpeciesDisplayView: SCTableIndexDelegate{
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int) {
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}
extension SCSpeciesDisplayView: SCSpeciesViewCellDelegate{
    func didTapImageView(view: SCSpeciesViewCell, urlString: String) {
        delegate?.didTapImageView(view: self, urlString: urlString)
    }
}
