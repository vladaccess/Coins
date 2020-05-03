//
//  df.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var cryptocurrencyPriceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}
