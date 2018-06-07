//
//  AppDelegate.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
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
        TaskManagement.shared.save()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        TaskManagement.shared.save()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        TaskManagement.shared.save()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        TaskManagement.shared.save()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        TaskManagement.shared.save()
    }


}

