//
//  Collection.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

extension Collection {
    subscript(safe index: Index) -> Element? {
        if indices.contains(index) {
            return self[index]
        } else {
            return nil
        }
    }
}
