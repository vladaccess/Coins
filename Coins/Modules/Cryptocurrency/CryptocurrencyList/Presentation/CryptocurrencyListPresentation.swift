//
//  CryptocurrencyListPresentation.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

protocol CryptocurrencyListPresentation: AnyObject {
    func set(models: [CryptocurrencyViewModel])
}

protocol CryptocurrencyListPresentationDelegate: AnyObject {
    func cryptocurrencyDidSelect(with model: CryptocurrencyViewModel, at index: Int)
}
