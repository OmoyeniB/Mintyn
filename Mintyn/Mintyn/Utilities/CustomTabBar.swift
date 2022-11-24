//
//  CustomTabBar.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class CustomTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 1
        setupMiddleButton()
        configureTabBar()
    }
    
    func configureTabBar() {
        self.tabBar.tintColor = Constants.Colors.goldColor
        self.tabBar.unselectedItemTintColor = Constants.Colors.greyColor
        self.tabBar.backgroundColor = .clear
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 30, y: -25, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(named: "moreIcon"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
    
}
