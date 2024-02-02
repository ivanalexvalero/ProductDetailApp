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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.backgroundColor = UIColor(named: "Gray")
        self.title = "Product Detail App"
    }
    
    func setup() {
        
    }
}
