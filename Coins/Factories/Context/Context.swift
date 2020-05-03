//
//  Context.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

class Context {
    let cryptocurrencyService: CryptocurrencyService
    
    init(cryptocurrencyService: CryptocurrencyService) {
        self.cryptocurrencyService = cryptocurrencyService
    }
}
