//
//  CustomTabBarController.swift
//  facebook
//
//  Created by Shaun Tucker on 3/17/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        
        viewControllers = [navigationController]
    }
}
