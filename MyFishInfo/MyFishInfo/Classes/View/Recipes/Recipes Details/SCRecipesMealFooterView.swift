//
//  SCRecipesMealFooterView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCRecipesMealFooterView: UIView {
    class func footerViewWithHeight(height: CGFloat)->SCRecipesMealFooterView{
        let nib = UINib(nibName: "SCRecipesMealFooterView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCRecipesMealFooterView
        v.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.screenWidth(), height: height))
        return v
    }
    @IBOutlet weak var instructionLabel: UILabel!
}
