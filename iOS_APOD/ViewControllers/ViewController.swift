//
//  ViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 23/5/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    let networking = NetworkService()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchTodaysImage()
        view.backgroundColor = UIColor.lightGray
    }
    
    //MARK: - Methods
    
    private func fetchTodaysImage() {
        networking.fetchTodaysImage() { result in
            switch result {
            case .success(let picture):
                print(picture)
            case .failure(let error):
                let alertController = UIAlertController(title: "error", message: error.asAFError?.errorDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
    }
    
}

