//
//  CryptocurrencyDetailsViewControllerFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 04.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyDetailsViewControllerFactory: StoryboardViewControllerFactory<CryptocurrencyDetailsViewController> {
    
    init() {
        super.init(storyboardResource: R.storyboard.cryptocurrencyDetails)
    }
    
    override func create() -> CryptocurrencyDetailsViewController {
        let viewController = super.create()

        return viewController
    }
    
}
