//
//  PhotosTableTypes.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import Foundation

protocol PhotosTablePresentable {
    
    var navigationTitle: String { get }
    var numberOfSections: Int { get }
    
    func viewDidLoad(view: PhotosTableView)
    func numberOfRows(for section: Int) -> Int
    func getImage(for indexPath: IndexPath) -> NasaPicture
    func didSelect(at indexPath: IndexPath)
}

protocol PhotosTableView: AnyObject {
    func showImage(_ image: NasaPicture)
}
