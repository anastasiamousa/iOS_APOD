//
//  Color.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 6/7/23.
//

import UIKit

enum Color {
    enum Text: String {
        case gray  = "Text.Gray"
        case black = "Text.Black"
        case white = "Text.White"
        
        var color: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }
    
    enum Background: String {
        case gray   = "Background.Gray"
        case petrol = "Background.Petrol"
        
        var color: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }
        
}
