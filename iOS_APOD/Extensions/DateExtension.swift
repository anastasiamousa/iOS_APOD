//
//  DateExtension.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 2/6/23.
//

import Foundation

extension Date {
    
    var toYYYYMMDD: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter.string(from: self)
    }
    
}
