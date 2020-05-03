//
//  ApiUrls.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

extension URL {
    private enum BaseUrl {
        static var backend: URL {
            return URL(string: "https://pro-api.coinmarketcap.com")!
        }
    }
        
    static var backendVer1: URL {
        return BaseUrl.backend / "v1"
    }
}
