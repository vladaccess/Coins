//
//  WindowTransition.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class WindowTransition: Transition {
    
    private let viewController: UIViewController
    private let window: UIWindow
    
    init(viewController: UIViewController, window: UIWindow) {
        self.viewController = viewController
        self.window = window
    }
    
    func perform() {
        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
    }
    
}
