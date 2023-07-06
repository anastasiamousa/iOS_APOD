//
//  UILabelExtension.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 6/7/23.
//

import UIKit

extension UILabel {
    
    func setFont(font: Font, color: Color.Text) {
        self.font = font.font
        self.textColor = color.color
    }
}
