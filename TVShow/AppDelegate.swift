//
//  AppDelegate.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public func applicationDidFinishLaunching(_ application: UIApplication) {
        let mainViewController = MainTabBarController()
        window = UIWindow()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }

}

