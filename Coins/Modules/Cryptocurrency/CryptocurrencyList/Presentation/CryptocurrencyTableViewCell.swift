//
//  CryptocurrencyTableViewCell.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

final class CryptocurrencyTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var shortNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var changePriceLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    //MARK: - View Lifecircle
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        prepare()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.layer.cornerRadius = max(iconImageView.bounds.width, iconImageView.bounds.height) / 2
    }
}

//MARK: - Public Methods

extension CryptocurrencyTableViewCell {
    func setup(for model: CryptocurrencyViewModel) {
        shortNameLabel.text = model.shortName
        fullNameLabel.text = model.fullName
        priceLabel.text = model.price
        changePriceLabel.text = model.changes
    }
}

//MARK: - Private Methods

private extension CryptocurrencyTableViewCell {
    func prepare() {
        backgroundColor = R.color.main()
        selectionStyle = .none
        
        fullNameLabel.textColor = .white
        shortNameLabel.textColor = R.color.second()
        priceLabel.textColor = .white
        changePriceLabel.textColor = .white
        iconImageView.backgroundColor = R.color.second()
    }
}
