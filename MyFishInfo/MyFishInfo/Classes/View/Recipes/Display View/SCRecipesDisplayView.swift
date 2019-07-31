//
//  SCRecipesDisplayView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

protocol SCRecipesDisplayViewDelegate: NSObjectProtocol {
    func didSelectedCell(view: SCRecipesDisplayView, index: Int)
}
private let reuseIdenfier = "recipes_cell"
class SCRecipesDisplayView: UIView {
    weak var delegate: SCRecipesDisplayViewDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var meals: [SCRecipesDataItem]?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    class func displayView()->SCRecipesDisplayView{
        let nib = UINib(nibName: "SCRecipesDisplayView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCRecipesDisplayView
        v.frame = UIScreen.main.bounds
        return v
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = AnimatedCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.screenWidth(), height: UIScreen.screenWidth())
        layout.animator = CubeAttributesAnimator()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SCRecipesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdenfier)
    }
}
extension SCRecipesDisplayView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdenfier, for: indexPath) as! SCRecipesCollectionViewCell
        cell.item = meals?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedCell(view: self, index: indexPath.item)
    }
}
