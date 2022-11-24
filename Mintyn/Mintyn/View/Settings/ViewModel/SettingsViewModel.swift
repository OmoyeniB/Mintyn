//
//  SettingsViewModel.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

protocol SettingsViewModelProtocol {
    func createSettingsDisplayModel() -> [SettingsModel]
    func showLegalModelData() -> [Legal_System_Model]
    func showSettingData() -> [Legal_System_Model]
    var darkLightTheme: Bool { get set }
    func lightDarkTheme()
    func configureAppearance(label: String, indexPath: IndexPath)
}

import UIKit

final class SettingsViewModel: SettingsViewModelProtocol {
    
    var darkLight = false
    var darkLightTheme = false {
        didSet {
            lightDarkTheme()
        }
    }
    
    func configureAppearance(label: String, indexPath: IndexPath) {
        switch label {
        case "Legal":
            if let urlString = URL(string: "https://docs.google.com/document/d/1DXUwi0L1xQbXcqi5S4MDGStdKfC60iTPRxyeNc_voqA/edit?usp=sharing") {
                UIApplication.shared.open(urlString)
            }
        case "System":
            let appDelegate = UIApplication.shared.windows.first
            if indexPath.row == 1 {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    appDelegate?.overrideUserInterfaceStyle = .light
                }
                else {
                    appDelegate?.overrideUserInterfaceStyle = .dark
                }
            }
            else if indexPath.row == 0 {
                darkLight = false
                darkLightTheme = darkLight
                appDelegate?.overrideUserInterfaceStyle = .light
            } else if indexPath.row == 2 {
                darkLight = true
                darkLightTheme = darkLight
                appDelegate?.overrideUserInterfaceStyle = .dark
            }
        default:
            break
        }
    }
    
    func lightDarkTheme() {
        UserDefaults.standard.set(darkLightTheme, forKey: "darkLight")
    }
    
    func showSettingData() -> [Legal_System_Model] {
        return [ Legal_System_Model(label: "Default"),
                 Legal_System_Model(label: "Light Mode"),
                 Legal_System_Model(label: "Dark Mode")]
    }
    
    func showLegalModelData() -> [Legal_System_Model] {
        return [Legal_System_Model(label: "Mintyn Account - Terms & Conditions"),
                Legal_System_Model(label: "Minty Privacy Policy"),
                Legal_System_Model(label: "Saving Goal - Terms & Conditions")]
    }
    
    func createSettingsDisplayModel() -> [SettingsModel] {
        return [
            SettingsModel(image: "shield", label: "Legal"),
            SettingsModel(image: "iphone.rear.camera", label: "System"),
            SettingsModel(image: "rectangle.portrait.and.arrow.forward", label: "Logout")]
    }
    
    
    
    
}
