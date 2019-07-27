//
//  SCScienceItem.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 27/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCScienceItem {
    let keyName: String
    let description: String?
    var rowHeight: CGFloat = 0
    
    init(keyName: String, description: String?) {
        self.keyName = keyName
        self.description = description ?? ""
        rowHeight = calculateScienceCellRowHeight()
    }
    func calculateScienceCellRowHeight()->CGFloat{
        let margin: CGFloat = 3
        let labelHeight: CGFloat = 18
        let separatorViewHeight: CGFloat = 1
        let viewWidth = UIScreen.screenWidth() - margin * 2
        var height = margin
        height += labelHeight
        height += description?.heightWithConstrainedWidth(width: viewWidth, font: UIFont.systemFont(ofSize: 15)) ?? 0
        height += margin
        height += separatorViewHeight
        return height
    }
}
