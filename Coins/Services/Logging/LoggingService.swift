//
//  t.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

protocol LoggingService {
    func log(event: CustomStringConvertible)
    func log(event: CustomStringConvertible, with: [String: String])
    func log(error: CustomStringConvertible, with: [String: String])
}
