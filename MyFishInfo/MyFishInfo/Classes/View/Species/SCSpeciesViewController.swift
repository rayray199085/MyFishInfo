//
//  SCSpeciesViewController.swift
//  MyFinanceInfo
//
//  Created by Stephen Cao on 14/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import SKPhotoBrowser

class SCSpeciesViewController: UIViewController {
    private let listViewModel = SCSpeciesListViewModel()
    private let displayView = SCSpeciesDisplayView.displayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
}
private extension SCSpeciesViewController{
    func setupUI(){
        view.addSubview(displayView)
        displayView.delegate = self
    }
    
    func loadData(){
        listViewModel.loadSpeciesData { [weak self](isSuccess) in
            self?.displayView.viewModels = self?.listViewModel.viewModels
            self?.displayView.tableIndex.setView(self?.listViewModel.speciesName ?? [])
        }
    }
}
extension SCSpeciesViewController: SCSpeciesDisplayViewDelegate{
    func didSelectedCell(view: SCSpeciesDisplayView, index: Int) {
        let vc = SCSpeciesDetailsController()
        vc.viewModel = listViewModel.viewModels?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapImageView(view: SCSpeciesDisplayView, urlString: String) {
        guard let url = URL(string: urlString) else{
            return
        }
        UIImage.downloadImage(url: url) { (image) in
            guard let image = image else{
                return
            }
            var images = [SKPhoto]()
            let photo = SKPhoto.photoWithImage(image)
            photo.shouldCachePhotoURLImage = false
            images.append(photo)
            
            let browser = SKPhotoBrowser(photos: images)
            browser.initializePageIndex(0)
            self.present(browser, animated: true, completion: {})
        }
    }
}
