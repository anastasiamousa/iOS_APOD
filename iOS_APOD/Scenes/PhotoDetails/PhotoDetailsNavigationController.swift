//
//  PhotoDetailsNavigationController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 11/7/23.
//

import UIKit

class PhotoDetailsNavigationController: UINavigationController {

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let presenter = PhotoDetailsPresenter()
        let controller = PhotoDetailsViewController(presenter: presenter)
        self.viewControllers = [controller]
    }

}
