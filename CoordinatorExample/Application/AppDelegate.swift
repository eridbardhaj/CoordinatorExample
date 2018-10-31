//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Erid Bardhaj on 10/31/18.
//  Copyright © 2018 Erid Bardhaj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    // MARK: - Properties
    // MARK: Mutable
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    
    // MARK: - Protocol Conformance
    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
}

