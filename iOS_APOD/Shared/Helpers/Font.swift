//
//  Font.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 6/7/23.
//

import UIKit

enum Font {
    case regular(CGFloat)
    case light(CGFloat)
    case bold(CGFloat)
    
    var font: UIFont {
        switch self {
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .light(let size):
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}
