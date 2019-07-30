//
//  SCRecipesDetailsController.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 30/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import MobilePlayer

private let reuseIdentifier = "ingredient_cell"
class SCRecipesDetailsController: UIViewController {
    var viewModel: SCRecipesViewModel?
    @IBOutlet weak var tableView: UITableView!
    private let videoButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "video"), for: [])
        btn.setImage(UIImage(named: "video_highlighted"), for: .highlighted)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    @objc private func clickVideoButton(){
        guard let videoUrl = viewModel?.videoUrl else{
            return
        }
        let playerVC = MobilePlayerViewController(contentURL: videoUrl)
        playerVC.title = viewModel?.mealName
        playerVC.activityItems = [videoUrl]
        present(playerVC, animated: true, completion: nil)
    }
        
}
private extension SCRecipesDetailsController{
    func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: videoButton)
        videoButton.addTarget(self, action: #selector(clickVideoButton), for: UIControl.Event.touchUpInside)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 44
        tableView.register(UINib(nibName: "SCRecipesMealCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        let footerView = SCRecipesMealFooterView.footerViewWithHeight(height: viewModel?.instructionViewHeight ?? 0)
        footerView.instructionLabel.text = viewModel?.instructions
        tableView.tableFooterView = footerView
       
    }
    func loadData(){
        
    }
}
extension SCRecipesDetailsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.ingredients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCRecipesMealCell
        cell.ingredient = viewModel?.ingredients?[indexPath.row]
        return cell
    }
}
