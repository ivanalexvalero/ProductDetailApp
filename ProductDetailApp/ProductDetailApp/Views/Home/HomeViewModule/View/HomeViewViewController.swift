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
    var products = [Products.Result]()
    var filteredProducts = [Products.Result]()
    
//  Search Bar
    lazy var searchController: UISearchController = {
       let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.loadViewIfNeeded()
        search.obscuresBackgroundDuringPresentation = false
        
        search.searchBar.placeholder = Constants.searchPlaceHolder
        search.searchBar.sizeToFit()
        search.searchBar.searchBarStyle = .prominent
        
        search.searchBar.scopeButtonTitles = Constants.searchScopeButtonTitles
        search.searchBar.delegate = self
        
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configTableView()
        filteredProducts = products
        presenter?.fetch()
        navigationItem.searchController = searchController
        
        self.view.backgroundColor = UIColor(named: Constants.Colors.gray)
        self.title = Constants.firstViewTitle
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
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
    
    private func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeisFeltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeisFeltering   )
    }
    
    private func setup() {
        let viewController = self
        let interactor = HomeViewInteractor()
        let presenter = HomeViewPresenter()
        let router = HomeViewRouter()
     
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController

        interactor.presenter = presenter
        viewController.presenter = presenter
        router.presenter = presenter
        router.viewController = viewController
    }
    
    func updateTableView(products: [Products.Result]) {
        self.products = products
        productTableView.reloadData()
    }
    
    func showError(_ error: connectionError) {
        switch error {
        case .failureResponse:
            showErrorAlert(title: Constants.failureTitle, message: Constants.failureMessage, ctaTitle: Constants.understood)
        case .requestFail:
            showErrorAlert(title: Constants.requestTitle, message: Constants.requestMessage, ctaTitle: Constants.acpet)
        case .errorData, .errorDecodingJson, .error:
            showErrorAlert(title: Constants.errorTitle, message: Constants.errorMessage, ctaTitle: Constants.retry)
        }
    }
}

extension HomeViewViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let searchText = searchBar.text,
              let scope = searchBar.scopeButtonTitles?[selectedScope] else { return }

        filterContentForSearchText(searchText: searchText, scope: scope)
    }
}

extension HomeViewViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchBarText = searchBar.text,
              let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        
        filterContentForSearchText(searchText: searchBarText, scope: scope)
    }
}

extension HomeViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering() ? filteredProducts.count : products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductTableViewCell.self)", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        
        let currentProduct: Products.Result
        
        currentProduct = isFiltering() ? filteredProducts[indexPath.row] : products[indexPath.row]
    
        cell.setupCell(model: currentProduct)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()

        let selectedProduct: Products.Result
        if isFiltering() {
            selectedProduct = filteredProducts[indexPath.row]
        } else {
            selectedProduct = products[indexPath.row]
        }

        vc.selectedProduct = selectedProduct
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewViewController {
//  Filter to searchBar
    func filterContentForSearchText(searchText: String, scope: String = Constants.allScopeButtonTitle) {
        searchController.searchBar.showsScopeBar = searchController.isActive ? true : false
        
        filteredProducts = products.filter({ product in
            let isMatchScope = (scope == Constants.allScopeButtonTitle) || (product.attributes.first?.valueName == scope)
            
            if isSearchBarEmpty() {
                return isMatchScope
            } else {
                return isMatchScope && product.title.lowercased().contains(searchText.lowercased())
            }
        })
        
        productTableView.reloadData()
    }
    
//  Present error alert
    func showErrorAlert(title:String, message: String, ctaTitle: String) {
        DispatchQueue.main.async {
              let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let okAction = UIAlertAction(title: ctaTitle, style: .default) { action in
                if action.style == .default {
                    self.presenter?.fetch()
                }
            }
              alertController.addAction(okAction)

            self.present(alertController, animated: true, completion: nil)
          }
      }
}
