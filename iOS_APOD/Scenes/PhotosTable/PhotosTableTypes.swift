//
//  PhotosTableTypes.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import Foundation

protocol PhotosTablePresentable {
    
    var navigationTitle: String { get }
    var numberOfRows: Int { get }
    
    func viewDidLoad()
    func numberOfSections(for indexPath: IndexPath) -> Int
    func getImage(for indexPath: IndexPath) -> NasaPicture?
    func didSelect(at indexPath: IndexPath)
}
