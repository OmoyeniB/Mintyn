//
//  SettingsViewController.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingViewModel = SettingsViewModel()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Constants.Colors.lightBlack
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = Constants.Colors.lightBlack
    }
    
}


extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingViewModel.createSettingsDisplayModel().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath)
            as? SettingsTableViewCell {
            cell.contentView.backgroundColor = Constants.Colors.lightBlack
            cell.setUpCell(model: settingViewModel.createSettingsDisplayModel()[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = LegalDetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
            vc.label = settingViewModel.createSettingsDisplayModel()[indexPath.row].label
        case 1:
            let vc = LegalDetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
            vc.label = settingViewModel.createSettingsDisplayModel()[indexPath.row].label
        default:
            weak var presentVc = self.presentingViewController
            self.dismiss(animated: true, completion: {
                let vc = LoginViewController()
                presentVc?.navigationController?.pushViewController(vc, animated: true)
            })
            
        }
    }
}
