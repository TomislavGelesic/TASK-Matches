//
//  AppDelegate.swift
//  TASK-Matches
//
//  Created by Tomislav Gelesic on 15/10/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let inputScreen = InputViewController()
        
        let navigationController = UINavigationController(rootViewController: inputScreen)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }




}

