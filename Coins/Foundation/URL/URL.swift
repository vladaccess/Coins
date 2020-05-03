//
//  1.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

func /(left: URL, right: String) -> URL {
    return left.appendingPathComponent(right)
}
