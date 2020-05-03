//
//  UITableView+Extenstions.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 02.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath,
                                                 cellType: T.Type = T.self) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType),
                                             for: indexPath) as? T else {
            preconditionFailure("Failed to dequeue a cell")
        }
        
        return cell
    }
}
