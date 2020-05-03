//
//  CryptocurrencyService.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

protocol CryptocurrencyService {
    func loadListCryptocurrency(start: Int,
                                limit: Int,
                                completion: @escaping (Swift.Result<[Cryptocurrency], Error>) -> Void)
}
