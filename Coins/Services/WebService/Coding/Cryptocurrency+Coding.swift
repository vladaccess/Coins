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
        case availableSupply = "circulating_supply"
        case usd = "USD"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let quoteContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .quote)
                
        id = try values.decode(.id)
        symbol = try values.decode(.symbol)
        title = try values.decode(.title)
        availableSupply = try values.decode(.availableSupply)
        quote = try quoteContainer.decode(.usd)
    }
}
