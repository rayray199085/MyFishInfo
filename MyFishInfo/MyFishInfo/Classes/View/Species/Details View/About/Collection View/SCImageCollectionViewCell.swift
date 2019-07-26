//
//  SCImageCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCImageCollectionViewCell: UICollectionViewCell {
    var imageUrlString: String?{
        didSet{
            speciesImageView.setImage(urlString: imageUrlString, placeholderImage: UIImage(named: "empty_picture"))
        }
    }
    @IBOutlet weak var speciesImageView: UIImageView!
}
