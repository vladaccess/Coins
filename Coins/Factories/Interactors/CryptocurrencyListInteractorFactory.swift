//
//  CryptocurrencyListInteractorFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 05.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyListInteractorFactory {
    
    private let context: Context
    
    init(context: Context) {
        self.context = context
    }
    
    func create(delegate: CryptocurrencyListInteractionDelegate) -> Interactable {
        let cryptocurrencyListViewController = CryptocurrencyListViewControllerFactory().create()
        let showTransition = ShowTransition(presenterViewController: context.navigationViewController, presentingViewController: cryptocurrencyListViewController)
        
        let interactor = CryptocurrencyListInteractor(cryptocurrencyService: context.cryptocurrencyService, presentation: cryptocurrencyListViewController, priceFormatter: NumberFormatter.cryptocurrencyPriceFormatter, show: showTransition)
        cryptocurrencyListViewController.delegate = interactor
        interactor.delegate = delegate
        
        return interactor
    }
}
