//
//  SCFavouriteCollectionViewCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCFavouriteCollectionViewCell: UICollectionViewCell {
    var viewModel: SCSpeciesViewModel?{
        didSet{
            speciesImageView.setImage(urlString: viewModel?.illustrationUrlString, placeholderImage: UIImage(named: "empty_picture"))
            speciesNameLabel.text = viewModel?.speciesName
            farmedLabel.isHidden = !(viewModel?.isFarmed ?? false)
        }
    }
    @IBOutlet weak var farmedLabel: UILabel!
    @IBOutlet weak var speciesImageView: UIImageView!
    @IBOutlet weak var speciesNameLabel: UILabel!
}
