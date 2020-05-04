//
//  AttributeTableViewCell.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 04.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        selectionStyle = .none
        backgroundColor = R.color.main()
        
        nameLabel.textColor = .white
        valueLabel.textColor = .white
    }
}

extension AttributeTableViewCell {
    func setup(for model: AttributeViewModel) {
        nameLabel.text = model.name
        valueLabel.text = model.value
    }
}
