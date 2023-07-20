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

    let presenter: PhotosTablePresentable
    
    static var nibName: String {
        String(describing: self)
    }
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.title = presenter.navigationTitle
        setUpTableView()
        presenter.viewDidLoad(view: self)
    }
    
    init(presenter: PhotosTablePresentable) {
        self.presenter = presenter
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension PhotosTableViewController: PhotosTableView {
    
    func showImage(_ image: NasaPicture) {
        let presenter = PhotoDetailsPresenter(with: image)
        let controller = PhotosTableViewController(presenter: presenter as! PhotosTablePresentable)
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
