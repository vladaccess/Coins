//
//  CryptocurrencyCoordinator.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class CryptocurrencyCoordinator {
    
    private let cryptocurrencyInteraction: Interactable
    
    private let navigationController: UINavigationController
    
    init(cryptocurrencyInteraction: Interactable, navigationController: UINavigationController) {
        self.cryptocurrencyInteraction = cryptocurrencyInteraction
        self.navigationController = navigationController
    }
}

extension CryptocurrencyCoordinator: Interactable {
    func start() {
        cryptocurrencyInteraction.start()
    }
}

extension CryptocurrencyCoordinator: CryptocurrencyListInteractionDelegate {
    func startDidSelectCryptocurrency(with cryptocurrency: Cryptocurrency) {
        let cryptocurrencyDetailsViewController = CryptocurrencyDetailsViewControllerFactory().create()
        let show = ShowTransition(presenterViewController: navigationController, presentingViewController: cryptocurrencyDetailsViewController)
        let cryptocurrencyDetailsInteractor = CryptocurrencyDetailsInteractor(cryptocurrencyId: cryptocurrency.id, presentation: cryptocurrencyDetailsViewController, show: show)
        
        cryptocurrencyDetailsInteractor.start()
    }
}
