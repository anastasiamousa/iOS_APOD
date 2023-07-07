//
//  BaseViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 7/7/23.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: - Properties
    
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Methods
    
    func showLoading(_ loading: Bool) {
        if loading {
            activityIndicator.center = self.view.center
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func presentError(_ error: Error) {
        let alertController = UIAlertController(title: "error", message: error.asAFError?.errorDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }

}
