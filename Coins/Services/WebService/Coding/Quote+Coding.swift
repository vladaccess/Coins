//
//  Quote+Coding.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 04.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

extension Quote: Decodable {
    enum CodingKeys: String, CodingKey {
        case price
        case change24 = "percent_change_24h"
        case marketCap = "market_cap"
        case volume24h = "volume_24h"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        price = try values.decode(.price)
        change24 = try values.decode(.change24)
        marketCap = try values.decode(.marketCap)
        volume24h = try values.decode(.volume24h)
    }
}
