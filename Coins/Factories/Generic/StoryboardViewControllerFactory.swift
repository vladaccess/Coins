//
//  StoryboardViewControllerFactory.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Rswift

class StoryboardViewControllerFactory<T> {
    
    let storyboardResource: StoryboardResourceType
    
    init(storyboardResource: StoryboardResourceType) {
        self.storyboardResource = storyboardResource
    }
    
    func create() -> T {
        return UIStoryboard(resource: storyboardResource).instantiateInitialViewController() as! T
    }
    
}
