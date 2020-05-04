//
//  CryptocurrencyDetailsInteractorFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 05.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyDetailsInteractorFactory {
    
    let context: Context
    
    init(context: Context) {
        self.context = context
    }
    
    func create(with cryptocurrency: Cryptocurrency) -> Interactable {
        let cryptocurrencyDetailsViewController = CryptocurrencyDetailsViewControllerFactory().create()
        let show = ShowTransition(presenterViewController: context.navigationViewController, presentingViewController: cryptocurrencyDetailsViewController)
        let cryptocurrencyDetailsInteractor = CryptocurrencyDetailsInteractor(cryptocurrency: cryptocurrency, presentation: cryptocurrencyDetailsViewController, show: show)
        
        return cryptocurrencyDetailsInteractor
    }
}
