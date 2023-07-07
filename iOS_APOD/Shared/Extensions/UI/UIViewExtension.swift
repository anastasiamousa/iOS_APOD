//
//  UIViewExtension.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 7/7/23.
//

import UIKit

extension UIView {
    
    func roundCorners() {
        layer.cornerRadius  = bounds.size.height / 2
        layer.masksToBounds = true
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius  = radius
        layer.masksToBounds = true
    }
}
