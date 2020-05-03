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
    
    private let context: Context
    
    init(_ contextFactory: ContextFactory) {
        context = contextFactory.build()
    }
    
    func createAppCoordinator() -> AppCoordinator {
        let cryptocurrencyNavigationViewController = RootNavigationControllerFactory().create()
        let cryptocurrencyViewController = CryptocurrencyListViewControllerFactory().create()
        cryptocurrencyNavigationViewController.viewControllers = [cryptocurrencyViewController]
        
        let mainMenuController = MainMenuViewControllerFactory().create()
        mainMenuController.cryptocurrencyListViewController = cryptocurrencyNavigationViewController
        mainMenuController.viewControllers = [cryptocurrencyNavigationViewController]
        
        let cryptocurrencyInteractor = CryptocurrencyListInteractor(cryptocurrencyService: context.cryptocurrencyService, presentation: cryptocurrencyViewController, priceFormatter: NumberFormatter.cryptocurrencyPriceFormatter)
        let cryptocurrencyCoordinator = CryptocurrencyCoordinator(cryptocurrencyInteraction: cryptocurrencyInteractor, navigationController: cryptocurrencyNavigationViewController)
        cryptocurrencyInteractor.delegate = cryptocurrencyCoordinator
        
        let windowTransition = WindowTransition(viewController: mainMenuController, window: WindowFactory().create())
        let mainMenuCoordinator = MainMenuCoordinator(show: windowTransition)
        
        cryptocurrencyViewController.delegate = cryptocurrencyInteractor
        
        return AppCoordinator(context: context, cryptocurrencyCoordinator: cryptocurrencyCoordinator, mainMenuCoordinator: mainMenuCoordinator)
    }
}

