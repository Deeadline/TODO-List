//
//  AppDelegate.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 18.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        TaskManagement.shared.load()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        TaskManagement.shared.store()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        TaskManagement.shared.store()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        TaskManagement.shared.load()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        TaskManagement.shared.store()
    }


}

