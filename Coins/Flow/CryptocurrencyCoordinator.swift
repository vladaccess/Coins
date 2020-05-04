//
//  CryptocurrencyCoordinator.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class CryptocurrencyCoordinator {
        
    let cryptocurrencyListInteractorFactory: CryptocurrencyListInteractorFactory
    var cryptocurrencyListInteractor: Interactable?
    let cryptocurrencyDetailsInteractorFactory: CryptocurrencyDetailsInteractorFactory
    var cryptocurrencyDetailsInteractor: Interactable?
    
    init(cryptocurrencyListInteractorFactory: CryptocurrencyListInteractorFactory,
         cryptocurrencyDetailsInteractorFactory: CryptocurrencyDetailsInteractorFactory) {
        self.cryptocurrencyListInteractorFactory = cryptocurrencyListInteractorFactory
        self.cryptocurrencyDetailsInteractorFactory = cryptocurrencyDetailsInteractorFactory
    }
}

extension CryptocurrencyCoordinator: Interactable {
    func start() {
        cryptocurrencyListInteractor = cryptocurrencyListInteractorFactory.create(delegate: self)
        cryptocurrencyListInteractor?.start()
    }
}

extension CryptocurrencyCoordinator: CryptocurrencyListInteractionDelegate {
    func startDidSelectCryptocurrency(with cryptocurrency: Cryptocurrency) {
        cryptocurrencyDetailsInteractor = cryptocurrencyDetailsInteractorFactory.create(with: cryptocurrency)
        cryptocurrencyDetailsInteractor?.start()
    }
}
