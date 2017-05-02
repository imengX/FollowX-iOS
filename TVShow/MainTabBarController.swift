//
//  MainTabBarController.swift
//  TVShow
//
//  Created by lkx on 16/4/22.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    //写一个初始化用的类
    private static func initNavController(storyboardName: String) -> UINavigationController {
        if let viewController = UIStoryboard(name: storyboardName,bundle: Bundle.main).instantiateInitialViewController() {
            return UINavigationController(rootViewController: viewController)
        } else {
            return UINavigationController(rootViewController: UIViewController())
        }
    }
    
    let discoverNavController = MainTabBarController.initNavController(storyboardName: "Discover")
    let searchNavController = MainTabBarController.initNavController(storyboardName: "Search")
//    let listNavController = MainTabBarController.initNavController("List")
    
//    required init?(coder aDecoder: NSCoder) { //required就不能（不需要）再写override了
//        super.init(coder: aDecoder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewControllers = [discoverNavController, searchNavController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
