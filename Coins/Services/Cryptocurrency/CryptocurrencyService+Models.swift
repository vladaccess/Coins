//
//  CryptocurrencyService+Models.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

struct CryptocurrencyResponse: Decodable {
    let data: [Cryptocurrency]
}
