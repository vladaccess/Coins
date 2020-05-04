//
//  ShowTransition.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 04.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class ShowTransition: Transition {
    
    private let presenterViewController: UINavigationController
    private let presentingViewController: UIViewController
    
    init(presenterViewController: UINavigationController, presentingViewController: UIViewController) {
        self.presenterViewController = presenterViewController
        self.presentingViewController = presentingViewController
    }
    
    func perform() {
        presenterViewController.show(presentingViewController, sender: nil)
    }
    
}
