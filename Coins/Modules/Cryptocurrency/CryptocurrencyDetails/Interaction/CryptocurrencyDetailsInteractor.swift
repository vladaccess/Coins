//
//  CryptocurrencyDetailsInteractor.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyDetailsInteractor {
    
    private let cryptocurrency: Cryptocurrency
    private let presentation: CryptocurrencyDetailsPresentation
    private let show: Transition
    
    init(cryptocurrency: Cryptocurrency,
         presentation: CryptocurrencyDetailsPresentation,
         show: Transition) {
        self.cryptocurrency = cryptocurrency
        self.presentation = presentation
        self.show = show
    }
}

extension CryptocurrencyDetailsInteractor: Interactable {
    
    func start() {
        show.perform()
        
        presentation.set(models: attributeViewModels(for: cryptocurrency))
    }
}

extension CryptocurrencyDetailsInteractor {
    func attributeViewModels(for cryptocurrency: Cryptocurrency) -> [AttributeViewModel] {
        let models = [AttributeViewModel(name: "Market Cap", value: String(cryptocurrency.quote.marketCap)),
                      AttributeViewModel(name: "Volume 24hr", value: String(cryptocurrency.quote.volume24h)),
                      AttributeViewModel(name: "Available Supply", value: String(cryptocurrency.availableSupply)),
                      AttributeViewModel(name: "% Change 24h", value: String(cryptocurrency.quote.change24))]
        
        return models
    }
}

struct AttributeViewModel {
    let name: String
    let value: String
}
