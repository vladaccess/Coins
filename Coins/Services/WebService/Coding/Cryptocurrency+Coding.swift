//
//  AddressDetails+Coding.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

extension Cryptocurrency: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case title = "name"
        case quote
        case usd = "USD"
        case price
        case change24 = "percent_change_24h"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let quoteContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .quote)
        let usdContainer = try quoteContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .usd)
        
        
        id = try values.decode(.id)
        symbol = try values.decode(.symbol)
        title = try values.decode(.title)
        price = try usdContainer.decode(.price)
        change24 = try usdContainer.decode(.change24)
    }
}
