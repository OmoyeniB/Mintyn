//
//  AppDelegate.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        setUpRootViewController(window: window)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardAppearance = .default
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        return true
    }
    

    func setUpRootViewController(window: UIWindow) {
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: loginViewController)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

