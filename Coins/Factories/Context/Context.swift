//
//  Context.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class Context {
    
    let cryptocurrencyService: CryptocurrencyService
    let navigationViewController: UINavigationController
    
    init(cryptocurrencyService: CryptocurrencyService,
         navigationViewController: UINavigationController) {
        self.cryptocurrencyService = cryptocurrencyService
        self.navigationViewController = navigationViewController
    }
}
