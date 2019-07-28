//
//  SCSpeciesDetailsController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 26/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import DLSlideView

class SCSpeciesDetailsController: UIViewController {
    var viewModel: SCSpeciesViewModel?
    @IBOutlet weak var tabedSlideView: DLTabedSlideView!
    private let aboutController =  UIStoryboard(name: "SCSpeciesAboutController", bundle: nil).instantiateViewController(withIdentifier: "species_about") as! SCSpeciesAboutController
    private let healthController = SCSpeciesHealthController()
    private let scienceController = SCSpeciesScienceController()
    private let fisheryController = SCSpeciesFisheryController()
    private lazy var favouriteButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"favourite_normal"), for: [])
        btn.setImage(UIImage(named: "favourite_selected"), for: .selected)
        return btn
    }()
    
    private let tabInfoArray = [["image":"about", "title": "About"],
                                ["image":"health", "title": "Health"],
                                ["image":"science", "title": "Science"],
                                ["image":"fishery", "title": "Fishery"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        guard let speciesName = title else{
            return
        }
        let res = CoreDataManager.shared.getSpeciesItemWith(name: speciesName)
        favouriteButton.isSelected = res.count > 0
    }
    private func getTabs()->[DLTabedbarItem]{
        var tabs = [DLTabedbarItem]()
        for dict in tabInfoArray{
            guard let imageName = dict["image"],
                let title = dict["title"],
                let normalImage = UIImage(named: imageName)?.modifyImageSize(newSize: CGSize(width: 20, height: 20)),
                let highlightedImage = UIImage(named: "\(imageName)_highlighted")?.modifyImageSize(newSize: CGSize(width: 20, height: 20)),
                let tabItem = DLTabedbarItem(title: title, image: normalImage, selectedImage: highlightedImage) else{
                    return tabs
            }
            tabs.append(tabItem)
        }
        return tabs
    }
    @objc private func clickFavouriteButton(){
        favouriteButton.isSelected = !favouriteButton.isSelected
    }
    @objc private func clickBackButton(){
        guard let speciesName = title else{
            return
        }
        let res = CoreDataManager.shared.getSpeciesItemWith(name: speciesName)
        if favouriteButton.isSelected{
            if res.count == 0{
                guard let item = viewModel?.item,
                      let data = try? JSONEncoder().encode(item) else{
                    return
                }
                CoreDataManager.shared.addSpeciesItemWith(name: speciesName, item: data)
            }
        }else{
            if res.count > 0{
                CoreDataManager.shared.deleteWith(name: speciesName)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
private extension SCSpeciesDetailsController{
    func setupUI(){
        setupTabedSlideView()
        setupNavigationItem()
    }
    func setupNavigationItem(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Species", fontSize: 16, target: self, action: #selector(clickBackButton), isBack: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favouriteButton)
        favouriteButton.addTarget(self, action: #selector(clickFavouriteButton), for: .touchUpInside)
    }
    func setupTabedSlideView(){
        tabedSlideView.baseViewController = self
        tabedSlideView.delegate = self
        tabedSlideView.tabItemNormalColor = UIColor.darkGray
        tabedSlideView.tabItemSelectedColor = InfoCommon.tinColor
        tabedSlideView.tabbarTrackColor = InfoCommon.tinColor
        tabedSlideView.tabbarBottomSpacing = 3.0
        
        tabedSlideView.tabbarItems = getTabs()
        tabedSlideView.buildTabbar()
        tabedSlideView.selectedIndex = 0
    }
}
extension SCSpeciesDetailsController: DLTabedSlideViewDelegate{
    func numberOfTabs(in sender: DLTabedSlideView!) -> Int {
        return 4
    }
    
    func dlTabedSlideView(_ sender: DLTabedSlideView!, controllerAt index: Int) -> UIViewController? {
        switch index {
        case 0:
            return aboutController
        case 1:
            return healthController
        case 2:
            return scienceController
        case 3:
            return fisheryController
        default:
            break
        }
        return UIViewController()
    }
    func dlTabedSlideView(_ sender: DLTabedSlideView!, didSelectedAt index: Int) {
        switch index {
        case 0:
            aboutController.viewModel = viewModel
        case 1:
            healthController.viewModel = viewModel
        case 2:
            scienceController.viewModel = viewModel
        case 3:
            fisheryController.viewModel = viewModel
        default:
            break
        }
    }
}
