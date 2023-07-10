//
//  PhotosTableViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import UIKit

class PhotosTableViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    
    //MARK: - Properties

    let images: [NasaPicture]
    
    static var nibName: String {
        String(describing: self)
    }
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setUpTableView()
    }
    
    //MARK: - Methods
}

private extension PhotosTableViewController {
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: PhotoTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.nibName)
        
        tableView.estimatedRowHeight = 64
    }

}
