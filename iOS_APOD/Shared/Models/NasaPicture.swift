//
//  NasaPicture.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 26/5/23.
//

import Foundation

struct NasaPicture: Decodable {
    let date: String
    let title: String
    let explanation: String
    let url: String
}
