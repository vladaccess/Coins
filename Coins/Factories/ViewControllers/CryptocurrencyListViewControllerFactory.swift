//
//  CryptocurrencyListViewControllerFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyListViewControllerFactory: StoryboardViewControllerFactory<CryptocurrencyListViewController> {
    
    init() {
        super.init(storyboardResource: R.storyboard.cryptocurrencyList)
    }
    
    override func create() -> CryptocurrencyListViewController {
        let viewController = super.create()

        return viewController
    }
    
}
