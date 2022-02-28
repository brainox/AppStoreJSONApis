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
        
        let redViewController = UIViewController()
//        redViewController.view.backgroundColor = .red
        redViewController.navigationItem.title = "APps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Red Nav bar"
        redNavController.navigationBar.prefersLargeTitles = true
    
        let blueViewController = UIViewController()
//        blueViewController.view.backgroundColor = .blue
        blueViewController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Blue Nav"
        blueNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }
}
