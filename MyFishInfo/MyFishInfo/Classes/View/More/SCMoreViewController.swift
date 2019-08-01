//
//  SCMoreViewController.swift
//  CardsHelper
//
//  Created by Stephen Cao on 18/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "more_cell"
private let appId = "1474927325"
private let emailAddress = "stephen.cao0805@outlook.com"

class SCMoreViewController: UIViewController {
    private let titleInfoArray = [
        ["title": "Rate us on the App Store", "iconName": "btn_rate","content":"We'd love to hear your feedback, whether you've got ideas on how we can improve - and would really appreciate it if you rate us on the App Store."],
        ["title": "Contact us", "iconName": "btn_email","content":"You can email us if you have any comments, suggestions or even ideas.\nYour opinion is very important to us."],
        ["title": "Fork us on GitHub", "iconName": "btn_fork", "content":"This is a free and open source application.\nIf you are interested in this app and want to make it become better, contact us to know more."],
        ["title": "Remove all favourite species: ", "iconName": "btn_remove", "content":"Select and confirm to delete all your favourite records."],
        ["title": "About", "iconName": "btn_about", "content": "Produced by: Rui Cao\nVersion: v1.0.2\nCopyright © 2019 Rui Cao. All rights reserved."]]
    
    private let tableView = UITableView(frame: UIScreen.main.bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
private extension SCMoreViewController{
    func setupUI(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        tableView.register(UINib(nibName: "SCMoreTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}
extension SCMoreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCMoreTableViewCell
        cell.content = titleInfoArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            guard let url = URL(string: "itms-apps://itunes.apple.com/app/" + appId) else{
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        case 1:
            guard let url = URL(string: "mailto:\(emailAddress)") else{
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        case 3:
            // create the alert
            let alert = UIAlertController(title: "Notice", message: "Would you like to continue removing all your favourite species?", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { (_) in
                CoreDataManager.shared.deleteAllSpecies()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            
            // show the alert
            present(alert, animated: true, completion: nil)
        case 4:
            guard let url = URL(string: "https://d3-assistant.firebaseapp.com") else{
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        default:
            break
        }
    }
}

