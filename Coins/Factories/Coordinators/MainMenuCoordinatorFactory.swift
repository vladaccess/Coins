//
//  MainMenuCoordinatorFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 05.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class MainMenuCoordinatorFactory {
    
    let mainMenuViewController: MainMenuViewController
    
    init(mainMenuViewController: MainMenuViewController) {
        self.mainMenuViewController = mainMenuViewController
    }
    
    func create() -> Interactable {
        return MainMenuCoordinator(show: WindowTransition(viewController: mainMenuViewController,
                                                          window: WindowFactory().create()))
    }
}
