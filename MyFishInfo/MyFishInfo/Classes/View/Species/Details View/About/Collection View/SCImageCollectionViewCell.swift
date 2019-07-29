//
//  SCImageCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCImageCollectionViewCell: UICollectionViewCell {
    var imageGalleryItem: SCSpeciesImageGalleryItem?{
        didSet{
            descriptionLabel.alpha = 0.0
            speciesImageView.setImage(urlString: imageGalleryItem?.src, placeholderImage: UIImage(named: "empty_picture"))
            descriptionLabel.text = imageGalleryItem?.alt
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        speciesImageView.isUserInteractionEnabled = true
        speciesImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImageView)))
    }
    @objc private func tapImageView(recognizer: UITapGestureRecognizer){
        speciesImageView.isUserInteractionEnabled = false
        let fromValue = descriptionLabel.alpha
        let toValue = fromValue == 0 ? 1 : 0
        descriptionLabel.addPopAlphaAnimation(fromValue: Double(fromValue), toValue: Double(toValue), duration: 0.25) { [weak self](_, _) in
            self?.speciesImageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var speciesImageView: UIImageView!
}
