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
        if let image = UIImage(named: "haha.png") {
            let aView = UIView(frame:CGRect(x:0,y:0,width:image.size.width, height:image.size.height))
            aView.backgroundColor = image.mostColor()
            
            window?.addSubview(aView)
        }
        
    }

}

