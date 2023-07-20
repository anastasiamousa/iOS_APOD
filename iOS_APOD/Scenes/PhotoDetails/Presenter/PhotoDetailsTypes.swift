//
//  PhotoDetailsTypes.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 11/7/23.
//

import Foundation
import UIKit

protocol PhotoDetailsPresentable {
    var navigationTitle: String { get }
    
    func viewDidLoad(view: PhotoDetailsView)
}

protocol PhotoDetailsView: AnyObject {
    func showLoadingState(_ loading: Bool)
    func showError(_ error: Error)
    func showImage(_ image: NasaPicture)
}
