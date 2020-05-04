//
//  RootNavigationControllerFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class RootNavigationControllerFactory {
    
    func create() -> RootNavigationController {
        let navigationController = RootNavigationController()
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.barTintColor = R.color.main()
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        return navigationController
    }
    
}
