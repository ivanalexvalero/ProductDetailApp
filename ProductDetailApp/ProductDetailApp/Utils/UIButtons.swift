//
//
//  UIButtons.swift
//  ProductDetailApp
//  ProductDetailApp
//
//  Created by Iván Valero on 31/01/2024.
//  Copyright © 2023 Telecom. All rights reserved.
//
// 

import UIKit

class PrincipalButton: UIButton {
    var customCornerRadius: CGFloat = 0
    var profileDisabledButton: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = customCornerRadius == 0 ? self.frame.height / 10 : customCornerRadius
    }
    
    override var isEnabled:Bool {
        didSet {
            if isEnabled {
                tintColor = .white
                backgroundColor = UIColor(named: "Purple")
            }
            else {
                backgroundColor = UIColor(named: "PurpleLight")
            }
        }
    }
}
