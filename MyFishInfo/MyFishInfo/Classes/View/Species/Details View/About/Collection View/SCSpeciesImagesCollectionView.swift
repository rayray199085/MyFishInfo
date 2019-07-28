//
//  SCSpeciesImagesCollectionView.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
private let reuseIdentifier = "collection_cell_id"
class SCSpeciesImagesCollectionView: UIView {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var imageGalleryItems: [SCSpeciesDataItemImageGallery]?{
        didSet{
            pageControl.numberOfPages = imageGalleryItems?.count ?? 0
        }
    }
    
    class func scrollImageView()->SCSpeciesImagesCollectionView{
        let nib = UINib(nibName: "SCSpeciesImagesCollectionView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCSpeciesImagesCollectionView
        v.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth(), height: UIScreen.screenWidth() * 2 / 3)
        return v
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SCImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
}
extension SCSpeciesImagesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageGalleryItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SCImageCollectionViewCell
        cell.imageGalleryItem = imageGalleryItems?[indexPath.item]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = scrollView.getCurrentIndex(collectionView: collectionView)
    }
}
