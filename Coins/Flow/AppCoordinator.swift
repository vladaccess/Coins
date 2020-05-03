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
    
    private let context: Context
    private let cryptocurrencyCoordinator: Interactable
    private let mainMenuCoordinator: Interactable
    
    //MARK: - Init
    
    init(context: Context,
         cryptocurrencyCoordinator: Interactable,
         mainMenuCoordinator: Interactable) {
        self.context = context
        self.cryptocurrencyCoordinator = cryptocurrencyCoordinator
        self.mainMenuCoordinator = mainMenuCoordinator
    }
}

extension AppCoordinator: Interactable {
    func start() {
        mainMenuCoordinator.start()
        cryptocurrencyCoordinator.start()
    }
}
