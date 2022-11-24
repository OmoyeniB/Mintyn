//
//  LegalDetailsViewController.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

import UIKit

class LegalDetailsViewController: UIViewController {
    
    var label: String?
    let viewModel = SettingsViewModel()
    let tableView = UITableView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        configureTableView()
        title = label
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsLegalCell.self, forCellReuseIdentifier: SettingsLegalCell.identifier)
        tableView.backgroundColor = Constants.Colors.lightBlack
    }
    
    
}

extension LegalDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.showLegalModelData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch label {
        case "Legal":
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsLegalCell.identifier, for: indexPath) as? SettingsLegalCell, let label {
                cell.setUpCell(model: viewModel.showLegalModelData()[indexPath.row], checklabel: label)
                return cell
            }
        case "System":
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsLegalCell.identifier, for: indexPath) as? SettingsLegalCell, let label {
                cell.setUpCell(model: viewModel.showSettingData()[indexPath.row], checklabel: label)
                cell.pointerImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension LegalDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let label {
            viewModel.configureAppearance(label: label, indexPath: indexPath)
        }
    }
}





