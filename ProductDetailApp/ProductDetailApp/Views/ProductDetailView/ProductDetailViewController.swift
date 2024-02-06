//
//
//  ProductDetailViewController.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 04/02/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var imageProductDetailImageView: UIImageView!
    @IBOutlet weak var titleProductDetailLabel: UILabel!
    @IBOutlet weak var priceProductDetailLabel: UILabel!
    @IBOutlet weak var brandProductDetailLabel: UILabel!
    @IBOutlet weak var storeNameProductDetailLabel: UILabel!
    
    var selectedProduct: Products.Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.caracteristicTitle
        setupData()
    }
    
    func setupData() {
        if let selectedProduct = self.selectedProduct {
            self.titleProductDetailLabel.text = selectedProduct.title
            self.priceProductDetailLabel.text = selectedProduct.originalPrice != nil ? "$ \(selectedProduct.originalPrice!)" : Constants.noAvailableLabel
            self.brandProductDetailLabel.text = "Marca: " + (selectedProduct.attributes.first?.valueName ?? Constants.noAvailableLabel)
            self.storeNameProductDetailLabel.text = "Store: " + (selectedProduct.officialStoreName ?? Constants.noAvailableLabel)
            
            let image = selectedProduct.thumbnail
            guard let url = URL(string: image) else { return }
            imageProductDetailImageView.kf.setImage(with: url)
        }
    }
}
