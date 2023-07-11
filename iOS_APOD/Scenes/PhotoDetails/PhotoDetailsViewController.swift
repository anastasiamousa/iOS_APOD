//
//  PhotoDetailsViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 11/7/23.
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
    
    //MARK: - Properties
    
    private var presenter: PhotoDetailsPresentable
    
    static var nibName: String {
        String(describing: self)
    }
    
    //MARK: - Init
    
    init(presenter: PhotoDetailsPresentable) {
        self.presenter = presenter
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad(view: self)
        self.setUpUI()
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

extension PhotoDetailsViewController: PhotoDetailsView {
    
    func showError(_ error: Error) {
        self.presentError(error)
    }
    
    func showLoadingState(_ loading: Bool) {
        self.showLoading(loading)
    }
    
    func showImage(_ image: NasaPicture) {
        titleLabel.text = image.title
        dateLabel.text = image.date
        descriptionLabel.text = image.explanation
        copyrightLabel.text = image.copyright
        
        if let imageURL = URL(string: image.url) {
            photoImageView.af.setImage(withURL: imageURL)
        }
    }
    
}
