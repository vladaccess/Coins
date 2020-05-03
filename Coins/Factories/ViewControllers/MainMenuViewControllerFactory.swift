//
//  MainMenuViewControllerFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class MainMenuViewControllerFactory: StoryboardViewControllerFactory<MainMenuViewController> {
    
    init() {
        super.init(storyboardResource: R.storyboard.mainMenuViewController)
    }
    
    override func create() -> MainMenuViewController {
        let viewController = super.create()
        viewController.tabBar.barTintColor = R.color.main()
        viewController.tabBar.isTranslucent = false

        return viewController
    }
    
}
