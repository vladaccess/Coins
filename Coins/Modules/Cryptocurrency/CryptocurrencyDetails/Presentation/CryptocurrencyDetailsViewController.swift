//
//  CryptocurrencyDetailsViewController.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class CryptocurrencyDetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var models: [AttributeViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.attributeTableViewCell)
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
    }
}

extension CryptocurrencyDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = models[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(for: indexPath) as AttributeTableViewCell
        cell.setup(for: model)
        
        return cell
    }
}

extension CryptocurrencyDetailsViewController {
    func updateView() {
        guard isViewLoaded else { return }
        
        tableView.reloadData()
    }
}

extension CryptocurrencyDetailsViewController: CryptocurrencyDetailsPresentation {
    func set(models: [AttributeViewModel]) {
        self.models = models
        
        updateView()
    }
}
