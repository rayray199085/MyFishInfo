//
//  SCSpeciesScienceCell.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCSpeciesScienceCell: UITableViewCell {
    var scienceItem: SCScienceItem?{
        didSet{
            titleLabel.text = scienceItem?.keyName
            descriptionLabel.text = scienceItem?.description
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
