//
//  CryptocurrencyService.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Alamofire

class CryptocurrencyWebService: CryptocurrencyService {
    
    //MARK: - Properties
    
    let session: Session
    let logger: NetworkLogging
    
    //MARK: - Init
    
    init(session: Session, logger: NetworkLogging) {
        self.session = session
        self.logger = logger
    }
    
    //MARK: - Public Methods
    
    func loadListCryptocurrency(start: Int,
                                limit: Int,
                                completion: @escaping (Swift.Result<[Cryptocurrency], Error>) -> Void) {
        let parameters: Parameters = ["start": start,
                                      "limit": limit,
                                      "cryptocurrency_type": "coins"]
        
        session.request(URL.backendVer1 / "cryptocurrency/listings/latest",
                        method: .get,
                        parameters: parameters,
                        encoding: URLEncoding.default).responseDecodable(of: CryptocurrencyResponse.self) { [weak logger] (response) in
            logger?.log(response)
            
            switch response.result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
