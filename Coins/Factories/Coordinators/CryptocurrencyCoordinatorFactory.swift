//
//  CryptocurrencyCoordinatorFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 05.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyCoordinatorFactory {

    private let context: Context
    
    init(context: Context) {
        self.context = context
    }

    func create() -> Interactable {
        let listFactory = CryptocurrencyListInteractorFactory(context: context)
        let detailsFactory = CryptocurrencyDetailsInteractorFactory(context: context)
        
        return CryptocurrencyCoordinator(cryptocurrencyListInteractorFactory: listFactory, cryptocurrencyDetailsInteractorFactory: detailsFactory)
    }
}
