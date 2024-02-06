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
        switch error {
        case .failureResponse:
            view?.showErrorAlert(title: Constants.failureTitle, message: Constants.failureMessage, ctaTitle: Constants.understood)
        case .requestFail:
            view?.showErrorAlert(title: Constants.requestTitle, message: Constants.requestMessage, ctaTitle: Constants.acpet)
        case .errorData, .errorDecodingJson, .error:
            view?.showErrorAlert(title: Constants.errorTitle, message: Constants.errorMessage, ctaTitle: Constants.retry)
        }
    }
}
