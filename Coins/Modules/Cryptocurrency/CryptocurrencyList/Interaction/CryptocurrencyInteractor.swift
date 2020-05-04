//
//  CryptocurrencyInteractor.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

protocol CryptocurrencyInteraction: AnyObject {
    func loadListCryptocurrency()
}

protocol CryptocurrencyListInteractionDelegate: AnyObject {
    func startDidSelectCryptocurrency(with cryptocurrency: Cryptocurrency)
}

class CryptocurrencyListInteractor {
    
    private let presentation: CryptocurrencyListPresentation
    private let cryptocurrencyService: CryptocurrencyService
    private let priceFormatter: NumberFormatter
    private var cryptocurrency = [Cryptocurrency]()
    let show: Transition
    
    weak var delegate: CryptocurrencyListInteractionDelegate?

    private var offset: Int = 1
    
    init(cryptocurrencyService: CryptocurrencyService,
         presentation: CryptocurrencyListPresentation,
         priceFormatter: NumberFormatter,
         show: Transition) {
        self.presentation = presentation
        self.cryptocurrencyService = cryptocurrencyService
        self.priceFormatter = priceFormatter
        self.show = show
    }
    
    func updateViews(for cryptocurrency: [Cryptocurrency]) {
        let models = cryptocurrency.map { CryptocurrencyViewModel(shortName: $0.symbol, fullName: $0.title, price: priceFormatter.string(from: NSNumber(value: $0.quote.price)), changes: "\($0.quote.change24) %") }
        
        presentation.set(models: models)
    }
}

extension CryptocurrencyListInteractor: Interactable {
    func start() {
        show.perform()
        
        loadListCryptocurrency()
    }
}

extension CryptocurrencyListInteractor: CryptocurrencyInteraction {
    func loadListCryptocurrency() {
        cryptocurrencyService.loadListCryptocurrency(start: offset,
                                                     limit: Constants.limit) { (result) in
            switch result {
            case .success(let models):
                self.cryptocurrency = models
                
                self.updateViews(for: models)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}

extension CryptocurrencyListInteractor: CryptocurrencyListPresentationDelegate {
    func cryptocurrencyDidSelect(with model: CryptocurrencyViewModel, at index: Int) {
        guard let selectedCryptocurrency = cryptocurrency[safe: index] else { return }
        
        delegate?.startDidSelectCryptocurrency(with: selectedCryptocurrency)
    }
}

private extension CryptocurrencyListInteractor {
    struct Constants {
        static let limit: Int = 50
        static let sort: String = "cmc_rank"
    }
}

struct CryptocurrencyViewModel {
    let shortName: String
    let fullName: String
    let price: String?
    let changes: String?
}
