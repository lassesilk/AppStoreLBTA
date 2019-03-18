//
//  BaseTabBarController.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 28/02/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: MusicController(), title: "Music", image: #imageLiteral(resourceName: "music")),
            createNavController(viewController: TodayController(), title: "Today", image: #imageLiteral(resourceName: "today_icon")),
            createNavController(viewController: AppsPageController(), title: "Apps", image: #imageLiteral(resourceName: "apps")),
            createNavController(viewController: AppsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search"))
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
