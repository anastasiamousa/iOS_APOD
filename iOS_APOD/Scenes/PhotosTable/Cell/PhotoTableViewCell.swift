//
//  PhotoTableViewCell.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import UIKit
import AlamofireImage

class PhotoTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - IBActions
    
    //MARK: - Properties
    
    static var nibName: String { String(describing: self) }
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.roundCorners()
        titleLabel.setFont(font: .regular(14), color: .black)
        dateLabel.setFont(font: .light(12), color: .gray)
    }

   //MARK: - Methods
    
    func configure(with image: NasaPicture) {
        titleLabel.text = image.title
        dateLabel.text = image.date
        
        if let imageURL = URL(string: image.url) {
            photoImageView.af.setImage(withURL: imageURL)
        }
    }
    
}
