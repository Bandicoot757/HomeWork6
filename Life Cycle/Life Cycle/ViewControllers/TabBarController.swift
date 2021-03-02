//
//  TabBarController.swift
//  Life Cycle
//
//  Created by Stanislav Leontyev on 03.12.2020.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = LoginViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 0)
        
        let secondViewController = FeedViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Person"), tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList
        
    }
}
