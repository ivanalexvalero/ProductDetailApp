//
//
//  HomeViewProtocols.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 


import Foundation

protocol HomeViewViewProtocol {
    var presenter: HomeViewPresenterProtocol? { get set }
    func updateTableView(products: [Products.Result])
}

protocol HomeViewPresenterProtocol {
    var view: HomeViewViewProtocol? { get set }
    var interactor: HomeViewInteractorProtocol? { get set }
    var router: HomeViewRouterProtocol? { get set }
    
    func fetch()
    func getProduct(product: [Products.Result])
}

protocol HomeViewInteractorProtocol {
    var presenter: HomeViewPresenterProtocol? { get set }
    func fetch()
}

protocol HomeViewRouterProtocol {
    var presenter: HomeViewPresenterProtocol? { get set }
}
