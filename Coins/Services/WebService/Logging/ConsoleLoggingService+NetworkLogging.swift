//
//  t.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Alamofire

extension ConsoleLoggingService: NetworkLogging {
    
    func log<Value, Failure>(_ response: DataResponse<Value, Failure>) {
        
        var logInfo = buildLog(response)
        
        switch response.result {
        case .success:
            logInfo.removeValue(forKey: NetworkLoggingKeys.Response.body)
            log(event: NetworkLoggingKeys.success, with: logInfo)
        case .failure:
            log(error: NetworkLoggingKeys.error, with: logInfo)
        }
    }
    
    private func buildLog<Value, Failure>(_ response: DataResponse<Value, Failure>) -> [String: String] {
        
        var log: [String: String] = [:]
        
        /// request logging
        
        if let method = response.request?.httpMethod {
            log[NetworkLoggingKeys.Request.method] = method
        }
        
        if let path = response.request?.url?.absoluteString {
            log[NetworkLoggingKeys.Request.path] = path
        }
        
        if let headers: String? = {
            guard let headers = response.request?.allHTTPHeaderFields, headers.isEmpty == false else {
                return nil
            }
            
            return headers.description
            }() {
            log[NetworkLoggingKeys.Request.headers] = headers
        }
        
        if let body: String? = {
            guard let data = response.request?.httpBody else {
                return nil
            }
            
            return String(data: data, encoding: .utf8)
            }() {
            log[NetworkLoggingKeys.Request.body] = body
        }
        
        /// response logging
        
        if let code: String? = {
            guard let code = response.response?.statusCode else {
                return nil
            }
            
            return "\(code)"
            }() {
            log[NetworkLoggingKeys.Response.code] = code
        }
        
        log[NetworkLoggingKeys.Response.modelName] = {
            var name = "\(type(of: response.value))"
            
            ["Optional", "(", ")", "<", ">"].forEach {
                name = name.replacingOccurrences(of: $0, with: "")
            }
            
            return name
        }()
        
        if let error: String? = {
            guard let error = response.error else {
                return nil
            }
            
            return error.localizedDescription
            }() {
            log[NetworkLoggingKeys.Response.error] = error
        }
        
        if let body: String? = {
            guard let data = response.data else {
                return nil
            }
            
            return String(data: data, encoding: .utf8)
            }() {
            log[NetworkLoggingKeys.Response.body] = body
        }
        
        return log
    }
}

extension ConsoleLoggingService {
    
    struct NetworkLoggingKeys {
        
        struct Request {
            static let method = "Requset Method"
            static let path = "Request Path"
            static let headers = "Request Headers"
            static let body = "Request Body"
        }
        
        struct Response {
            static let code = "Response Code"
            static let modelName = "Response ModelName"
            static let error = "Response Error"
            static let body = "Response Body"
        }
        
        static let error = "Failed Response"
        static let success = "Success Response"
    }
}
