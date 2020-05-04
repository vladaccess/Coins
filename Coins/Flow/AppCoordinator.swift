//
//  AppCoordinator.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    //MARK: - Private Properties
    
    let cryptocurrencyCoordinatorFactory: CryptocurrencyCoordinatorFactory
    var cryptocurrencyCoordinator: Interactable?
    let mainMenuCoordinatorFactory: MainMenuCoordinatorFactory
    var mainMenuCoordinator: Interactable?
    
    //MARK: - Init
    
    init(cryptocurrencyCoordinatorFactory: CryptocurrencyCoordinatorFactory,
         mainMenuCoordinatorFactory: MainMenuCoordinatorFactory) {
        self.cryptocurrencyCoordinatorFactory = cryptocurrencyCoordinatorFactory
        self.mainMenuCoordinatorFactory = mainMenuCoordinatorFactory
    }
}

extension AppCoordinator: Interactable {
    func start() {
        mainMenuCoordinator = mainMenuCoordinatorFactory.create()
        mainMenuCoordinator?.start()
        cryptocurrencyCoordinator = cryptocurrencyCoordinatorFactory.create()
        cryptocurrencyCoordinator?.start()
    }
}
