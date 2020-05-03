//
//  NetworkLogging.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Alamofire

protocol NetworkLogging: AnyObject {
    
    func log<Value, Failure>(_ response: DataResponse<Value, Failure>)
    
}
