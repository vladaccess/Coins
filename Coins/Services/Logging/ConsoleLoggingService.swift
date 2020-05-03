//
//  t.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

class ConsoleLoggingService: LoggingService {
    
    private func getId() -> String {
        struct Static {
            static var id: UInt = 0
        }
        Static.id += 1
        return "\(Static.id)"
    }
    
    func log(event: CustomStringConvertible) {
        print("🔸", getId(), event, "🔸")
    }
    
    func log(event: CustomStringConvertible, with properties: [String: String]) {
        let id = getId()
        print("🔸\(id)", event)
        properties.keys.sorted().forEach {
            print($0, "▶︎", properties[$0]!)
        }
        print("🔸\(id)\n")

    }
    
    func log(error: CustomStringConvertible, with properties: [String: String]) {
        let id = getId()
        print("🆘\(id)", error, "🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘")
        properties.keys.sorted().forEach {
            print($0, "▶︎", properties[$0]!)
        }
        print("🆘\(id)\n")
    }
    
}
