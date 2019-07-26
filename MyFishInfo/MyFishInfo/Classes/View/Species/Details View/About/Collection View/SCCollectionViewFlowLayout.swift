//
//  SCCollectionViewFlowLayout.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else{
            return
        }
        collectionView.backgroundColor = .clear
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        itemSize = collectionView.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
}
