//
//  SCFavouriteDisplayView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 29/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

protocol SCFavouriteDisplayViewDelegate: NSObjectProtocol {
    func didSelectedCell(view: SCFavouriteDisplayView, index: Int)
}
private let reuseIdentifier = "favourite_cell"
class SCFavouriteDisplayView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: SCFavouriteDisplayViewDelegate?
    var viewModels: [SCSpeciesViewModel]?{
        didSet{
            collectionView.reloadData()
        }
    }
    class func displayView()->SCFavouriteDisplayView{
        let nib = UINib(nibName: "SCFavouriteDisplayView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCFavouriteDisplayView
        v.frame = UIScreen.main.bounds
        return v
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}
private extension SCFavouriteDisplayView{
    func setupUI(){
        setupCollectionView()
    }
    func setupCollectionView(){
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(UINib(nibName: "SCFavouriteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension SCFavouriteDisplayView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SCFavouriteCollectionViewCell
        cell.viewModel = viewModels?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedCell(view: self, index: indexPath.item)
    }
}
