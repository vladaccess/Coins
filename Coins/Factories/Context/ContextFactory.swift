//
//  ContextFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation
import Alamofire

class ContextFactory {
    
    private lazy var session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["X-CMC_PRO_API_KEY": "18adad75-73d3-44e3-839b-8f1acdf903c3"]
        let session = Alamofire.Session(configuration: configuration)
        
        return session
    }()
    
    lazy var loggingService: LoggingService & NetworkLogging = {
        
        #if DEBUG
        
        return ConsoleLoggingService()
        
        #endif
        
    }()
    
    private lazy var cryptocurrencyService = CryptocurrencyWebService(session: session, logger: loggingService)
    
    func build(with navigationController: UINavigationController) -> Context {
        return Context(cryptocurrencyService: cryptocurrencyService,
                       navigationViewController: navigationController)
    }
    
}
