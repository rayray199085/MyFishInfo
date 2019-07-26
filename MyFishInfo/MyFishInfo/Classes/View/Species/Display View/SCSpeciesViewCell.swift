//
//  SCSpeciesViewCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

protocol SCSpeciesViewCellDelegate: NSObjectProtocol {
    func didTapImageView(view: SCSpeciesViewCell, urlString: String)
}
class SCSpeciesViewCell: UITableViewCell {
    weak var delegate: SCSpeciesViewCellDelegate?
    
    var viewModel: SCSpeciesViewModel?{
        didSet{
            illustrationImageView.setImage(urlString: viewModel?.illustrationUrlString, placeholderImage: UIImage(named: "empty_picture"))
            nameLabel.text = viewModel?.speciesName
            aliasesLabel.text = viewModel?.speciesAliases
            isFarmedLabel.isHidden = !(viewModel?.isFarmed ?? false)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        illustrationImageView.isUserInteractionEnabled = true
        illustrationImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImageView)))
        
    }
    
    @objc private func tapImageView(_ sender: UITapGestureRecognizer){
        guard let urlString = viewModel?.illustrationUrlString else{
            return
        }
        delegate?.didTapImageView(view: self, urlString: urlString)
    }
    
    @IBOutlet weak var isFarmedLabel: UILabel!
    @IBOutlet weak var illustrationImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasesLabel: UILabel!
}
