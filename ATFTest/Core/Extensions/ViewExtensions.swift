//
//  ViewExtensions.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import UIKit

extension UIView {
    func drawShadow(color: CGColor = UIColor.black.cgColor,
                    forOpacity opacity: Float,
                    forOffset offset: CGSize,
                    radius: CGFloat = 10) {
        layer.masksToBounds = false
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}
