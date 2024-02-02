//
//
//  OnboardingSlide.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

struct OnboardingSlide {
    let title: String
    let description: String
    let image: UIImage
    
    init(title: String, description: String, image: UIImage? = nil) {
            self.title = title
            self.description = description
            self.image = image ?? UIImage()
        }
}
