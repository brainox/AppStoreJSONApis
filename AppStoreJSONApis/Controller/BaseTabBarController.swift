//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 18/12/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .white
        todayViewController.navigationItem.title = "Today"
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        todayNavController.navigationBar.prefersLargeTitles = true
        
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        tabBar.tintColor = .systemBlue
        
        
        
        viewControllers = [
            createNavController(viewController: AppsController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}


