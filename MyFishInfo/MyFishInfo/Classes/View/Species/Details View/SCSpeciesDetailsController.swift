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
    
    private let tabInfoArray = [["image":"about", "title": "About"],
                                ["image":"health", "title": "Health"],
                                ["image":"science", "title": "Science"],
                                ["image":"fishery", "title": "Fishery"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
}
private extension SCSpeciesDetailsController{
    func setupUI(){
        setupTabedSlideView()
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
        default:
            break
        }
    }
}
