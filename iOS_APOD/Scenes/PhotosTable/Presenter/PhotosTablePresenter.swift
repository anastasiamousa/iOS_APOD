//
//  PhotosTablePresenter.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import Foundation

class PhotoTablePresenter {
    
    //MARK: - Properties
    
    private let images: [NasaPicture]
    private var view: PhotosTableView?
    
    //MARK: - Init
    
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
    
    func viewDidLoad(view: PhotosTableView) {
        self.view = view
    }
    
    func numberOfRows(for section: Int) -> Int {
        return images.count
    }
    
    func getImage(for indexPath: IndexPath) -> NasaPicture {
        return images[indexPath.row]
    }
    
    func didSelect(at indexPath: IndexPath) {
        view?.showImage(images[indexPath.row])
    }
    
}
