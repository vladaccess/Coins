//
//  CryptocurrencyListViewController.swift
//  Coins
//
//  Created by Krasnokutskii Vladislav Nikolaevich on 03.05.2020.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class CryptocurrencyListViewController: UIViewController {
    
    //MARK: - Public Properties
    
    weak var delegate: CryptocurrencyListPresentationDelegate?

    //MARK: - Private Properties
    
    private var models: [CryptocurrencyViewModel] = []
    
    //MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - View Lifecirle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
}

//MARK: - Private Methods

private extension CryptocurrencyListViewController {
    func updateView() {
        guard isViewLoaded else { return }
        
        tableView.reloadData()
    }
    
    func prepare() {
        view.backgroundColor = R.color.main()
        title = LocalizedStrings.cryptocurrency
        
        tableView.backgroundColor = R.color.main()
        tableView.register(R.nib.cryptocurrencyTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - CryptocurrencyListPresentation

extension CryptocurrencyListViewController: CryptocurrencyListPresentation {
    func set(models: [CryptocurrencyViewModel]) {
        self.models = models
        
        updateView()
    }
}

//MARK: - UITableViewDataSource

extension CryptocurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = models[safe: indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as CryptocurrencyTableViewCell
        cell.setup(for: model)
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension CryptocurrencyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let model = models[safe: indexPath.row] else { return }
        
        delegate?.cryptocurrencyDidSelect(with: model, at: indexPath.row)
    }
}

//MARK: - LocalizedStrings
 
private extension CryptocurrencyListViewController {
    struct LocalizedStrings {
        static let cryptocurrency = R.string.cryptocurrencyList.cryptocurrency()
        static let search = R.string.cryptocurrencyList.search()
    }
}
