//
//  SCSpeciesImageGalleryItem.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

struct SCSpeciesImageGalleryItem {
    let src: String
    let alt: String
    let title: String
    
    init(src: String?, alt: String?, title: String?) {
        self.src = src ?? ""
        self.alt = alt ?? ""
        self.title = alt ?? ""
    }
}
