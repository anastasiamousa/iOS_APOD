//
//  PhotoDetailsPresenter.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 11/7/23.
//

import Foundation

class PhotoDetailsPresenter {
    
    //MARK: - Properties
    
    private let image: NasaPicture?
    private let network = NetworkService()
    private weak var view: PhotoDetailsView?
    
    //MARK: - Init
    
    init(with image: NasaPicture? = nil) {
        self.image = image
    }
}

private extension PhotoDetailsPresenter {
    
    func fetchTodaysImage() {
        view?.showLoadingState(true)
        network.fetchTodaysImage() { [weak self] result in
            self?.view?.showLoadingState(false)
            switch result {
            case .success(let picture):
                self?.view?.showImage(picture)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}

extension PhotoDetailsPresenter: PhotoDetailsPresentable {
    
    var navigationTitle: String {
        image == nil ? NSLocalizedString("home_tab_title", comment: "") : String(format: NSLocalizedString("photo_details_navigation_title", comment: ""), image?.date ?? "")
    }
    
    func viewDidLoad(view: PhotoDetailsView) {
        self.view = view
        if let image = image {
            view.showImage(image)
            return
        }
        fetchTodaysImage()
    }
    
}
