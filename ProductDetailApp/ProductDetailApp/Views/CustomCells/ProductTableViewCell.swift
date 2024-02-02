//
//
//  ProductTableViewCell.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 02/02/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
