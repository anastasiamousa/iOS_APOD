//
//  PhotosTablePresenter.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import Foundation

class PhotoTablePresenter {
    
    private let images: [NasaPicture]
    
    init(images: [NasaPicture]) {
        self.images = images
    }
}

extension PhotoTablePresenter: PhotosTablePresentable {
    
    var navigationTitle: String {
        return NSLocalizedString("photos_table_vc_title", comment: "")
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func viewDidLoad() {
        
    }
    
    func numberOfRows(for indexPath: IndexPath) -> Int {
        return images.count
    }
    
    func getImage(for indexPath: IndexPath) -> NasaPicture? {
        return images[indexPath.row]
    }
    
    func didSelect(at indexPath: IndexPath) {
        print(indexPath)
    }
}
