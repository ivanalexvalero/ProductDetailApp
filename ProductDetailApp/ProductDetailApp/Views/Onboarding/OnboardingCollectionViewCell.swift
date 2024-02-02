//
//
//  OnboardingCollectionViewCell.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak private var slideImageView: UIImageView!
    @IBOutlet weak private var slideTitleLabel: UILabel!
    @IBOutlet weak private var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        self.slideImageView.image = slide.image
        self.slideTitleLabel.text = slide.title
        self.slideDescriptionLabel.text = slide.description
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.verticalSizeClass == .compact {
            self.slideImageView.contentMode = .scaleAspectFit
            // Ejemplo de configuración de restricciones usando Auto Layout en el código
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

        } else {
            // Diseño para otros modos
        }
    }
}
