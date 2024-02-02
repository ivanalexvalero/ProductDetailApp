//
//
//  HomeViewViewController.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class HomeViewViewController: UIViewController, HomeViewViewProtocol {
    var presenter: HomeViewPresenterProtocol?

    @IBOutlet weak var productTableView: UITableView!
    let products = Product.getAllProducts()
    var filteredProducts = [Product]()
    
    lazy var searchController: UISearchController = {
       let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.loadViewIfNeeded()
        search.obscuresBackgroundDuringPresentation = false
        
        search.searchBar.placeholder = Constants.searchPlaceHolder
        search.searchBar.sizeToFit()
        search.searchBar.searchBarStyle = .prominent
        
        search.searchBar.scopeButtonTitles = ["Todos", "Auto", "Hogar", "Alimentos"]
        search.searchBar.delegate = self
        
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        filteredProducts = products
        
        
        navigationItem.searchController = searchController
        
        self.view.backgroundColor = UIColor(named: "Gray")
        self.title = "Product Detail"
    }
    
    func configTableView() {
        let nibProductCell = UINib(nibName: "\(ProductTableViewCell.self)", bundle: nil)
        productTableView.register(nibProductCell, forCellReuseIdentifier: "\(ProductTableViewCell.self)")
        
        productTableView.tableHeaderView?.removeFromSuperview()
        productTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        productTableView.layoutIfNeeded()
        
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "Todos") {
        searchController.searchBar.showsScopeBar = searchController.isActive ? true : false
        filteredProducts = products.filter({ (product: Product) -> Bool in
            let matchText = (scope == "Todos") || (product.type == scope)
            
            if isSearchBarEmpty() {
                return matchText
            } else {
                return matchText && product.title.lowercased().contains(searchText.lowercased())
            }
        })
        
        productTableView.reloadData()
    }
    
    private func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeisFeltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeisFeltering   )
    }
}

extension HomeViewViewController: UISearchBarDelegate {
//    search bar UIView
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let searchText = searchBar.text,
              let scope = searchBar.scopeButtonTitles?[selectedScope] else { return }
        
        filterContentForSearchText(searchText: searchText, scope: scope)
    }
}

extension HomeViewViewController: UISearchResultsUpdating {
//    update UIView results
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchBarText = searchBar.text,
              let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        
        filterContentForSearchText(searchText: searchBarText, scope: scope)
    }
    
    
}

extension HomeViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() { return filteredProducts.count }
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductTableViewCell.self)", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        let currentProduct: Product
        
        if isFiltering() {
            currentProduct = filteredProducts[indexPath.row]
        } else {
            currentProduct = products[indexPath.row]
        }
        
        cell.productTitleLabel.text = currentProduct.title
        cell.productCategoryLabel.text = currentProduct.type
        cell.productImageView.image = currentProduct.image
        
        return cell
        
    }
}
