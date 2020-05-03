//
//  CryptocurrencyDetailsInteractor.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class CryptocurrencyDetailsInteractor {
    
    private let cryptocurrencyId: Int
    private let presentation: CryptocurrencyDetailsPresentation
    private let show: Transition
    
    init(cryptocurrencyId: Int, presentation: CryptocurrencyDetailsPresentation, show: Transition) {
        self.cryptocurrencyId = cryptocurrencyId
        self.presentation = presentation
        self.show = show
    }
}

extension CryptocurrencyDetailsInteractor: Interactable {
    
    func start() {
        show.perform()
    }
}
