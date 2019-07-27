//
//  SCSpeciesHealthHeaderView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCSpeciesHealthHeaderView: UIView {
    var tasteStrings:[String]?{
        didSet{
            for (index,str) in (tasteStrings ?? []).enumerated(){
                tasteLabels[index].text = str
            }
        }
    }
    
    @IBOutlet var tasteLabels: [UILabel]!
    class func headerView(height: CGFloat)->SCSpeciesHealthHeaderView{
        let nib = UINib(nibName: "SCSpeciesHealthHeaderView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCSpeciesHealthHeaderView
        v.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth(), height: height)
        return v
    }

}
