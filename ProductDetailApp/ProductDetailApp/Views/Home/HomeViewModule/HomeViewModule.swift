//
//
//  HomeViewModule.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 


import UIKit

class HomeViewModule {
    
    class func build()-> UIViewController {
        
        let viewController = HomeViewViewController()
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
        
        return viewController
    }
}
