//
//  MainMenuCoordinator.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

class MainMenuCoordinator {
    
    private let show: Transition
    
    init(show: Transition) {
        self.show = show
    }
}

extension MainMenuCoordinator: Interactable {
    func start() {
        show.perform()
    }
}
