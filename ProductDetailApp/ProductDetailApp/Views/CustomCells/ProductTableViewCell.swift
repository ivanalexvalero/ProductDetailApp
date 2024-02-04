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
import Kingfisher
import SkeletonView

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupSkeleton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(model: Products.Result) {
        self.showSkeleton()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.hideSkeleton()

            self.productTitleLabel.text = model.title
            self.productCategoryLabel.text = model.attributes.first?.valueName
            self.productPriceLabel.text = model.originalPrice != nil ? "$ \(model.originalPrice!)" : Constants.noAvailableLabel
            let image = model.thumbnail
            guard let url = URL(string: image) else { return }
            self.productImageView.kf.setImage(with: url)
        }
    }
    
    private func setupSkeleton() {
        self.productTitleLabel.isSkeletonable = true
        self.productTitleLabel.linesCornerRadius = 8
        self.productCategoryLabel.isSkeletonable = true
        self.productCategoryLabel.linesCornerRadius = 8
        self.productPriceLabel.isSkeletonable = true
        self.productPriceLabel.linesCornerRadius = 8
        self.productImageView.isSkeletonable = true
    }
    
    private func showSkeleton() {
        self.productTitleLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(named: Constants.Colors.gray) ?? .gray), animation: nil, transition: .crossDissolve(0.5))
        self.productCategoryLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(named: Constants.Colors.gray) ?? .gray), animation: nil, transition: .crossDissolve(0.5))
        self.productPriceLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(named: Constants.Colors.gray) ?? .gray), animation: nil, transition: .crossDissolve(0.5))
        self.productImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(named: Constants.Colors.gray) ?? .gray), animation: nil, transition: .crossDissolve(0.5))
    }
    
    private func hideSkeleton() {
        self.productTitleLabel.hideSkeleton()
        self.productCategoryLabel.hideSkeleton()
        self.productPriceLabel.hideSkeleton()
        self.productImageView.hideSkeleton()
    }
}
