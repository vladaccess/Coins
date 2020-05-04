//
//  AppCoordinatorBuilder.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit
 
protocol CoordinatorFactory {
    func create() -> Interactable
}

class AppCoordinatorBuilder {
    
    private let contextFactory: ContextFactory
    
    init(_ contextFactory: ContextFactory) {
        self.contextFactory = contextFactory
    }
    
    func createAppCoordinator() -> AppCoordinator {
        let cryptocurrencyNavigationViewController = RootNavigationControllerFactory().create()
                
        let mainMenuController = MainMenuViewControllerFactory().create()
        mainMenuController.cryptocurrencyListViewController = cryptocurrencyNavigationViewController
        mainMenuController.viewControllers = [cryptocurrencyNavigationViewController]
        
        let cryptocurrencyCoordinatorFactory = CryptocurrencyCoordinatorFactory(context: contextFactory.build(with: cryptocurrencyNavigationViewController))
        
        let mainMenuCoordinatorFactory = MainMenuCoordinatorFactory(mainMenuViewController: mainMenuController)

        
        return AppCoordinator(cryptocurrencyCoordinatorFactory: cryptocurrencyCoordinatorFactory,
                              mainMenuCoordinatorFactory: mainMenuCoordinatorFactory)
    }
}

