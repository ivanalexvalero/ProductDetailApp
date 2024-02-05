//
//
//  HomeViewPresenter.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import Foundation

class HomeViewPresenter: HomeViewPresenterProtocol {
    
    var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorProtocol?
    var router: HomeViewRouterProtocol?

    func fetch() {
        interactor?.fetch()
    }
    
    func getProduct(product: [Products.Result]) {
        view?.updateTableView(products: product)
    }
    
    func showError(_ error: connectionError) {
        view?.showError(error)
    }
}
