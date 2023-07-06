//
//  PhotoDetailsViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 6/7/23.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var copyrightLabel: UILabel!
    
    //MARK: - IBActions
    
    //MARK: - Properties
    
    let networking = NetworkService()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchTodaysImage()
        self.setUpUI()
    }
    
    //MARK: - Methods
    
}

private extension PhotoDetailsViewController {
    func fetchTodaysImage() {
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

private extension PhotoDetailsViewController {
    func setUpUI() {
        self.titleLabel.font = Font.bold(16).font
        self.dateLabel.font = Font.light(16).font
        self.descriptionLabel.font = Font.regular(16).font
        self.copyrightLabel.font = Font.light(16).font

        self.titleLabel.textColor = UIColor(named: "Background.Petrol")
    }
}
