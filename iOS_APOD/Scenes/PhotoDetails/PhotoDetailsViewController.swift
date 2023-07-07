//
//  PhotoDetailsViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 6/7/23.
//

import UIKit
import Alamofire
import AlamofireImage

class PhotoDetailsViewController: BaseViewController {
    
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
        showLoading(true)
        networking.fetchTodaysImage() { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success(let picture):
                print(picture)
                self?.handleResponse(picture: picture)
            case .failure(let error):
                self?.presentError(error)
            }
        }
    }
    
    func handleResponse(picture: NasaPicture) {
        titleLabel.text = picture.title
        dateLabel.text = picture.date
        descriptionLabel.text = picture.explanation
        copyrightLabel.text = picture.copyright
        
        if let imageURL = URL(string: picture.url) {
            photoImageView.af.setImage(withURL: imageURL)
        }
    }
}

private extension PhotoDetailsViewController {
    func setUpUI() {
        self.titleLabel.setFont(font: Font.bold(16), color: Color.Text.black)
        self.dateLabel.setFont(font: Font.light(16), color: Color.Text.gray)
        self.descriptionLabel.setFont(font: Font.regular(16), color: Color.Text.black)
        self.copyrightLabel.setFont(font: Font.light(16), color: Color.Text.gray)
    }
}
