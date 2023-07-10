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
    let copyright: String
    let media_type: String
    let service_version: String
    let url: String
    let hdurl: String
}
