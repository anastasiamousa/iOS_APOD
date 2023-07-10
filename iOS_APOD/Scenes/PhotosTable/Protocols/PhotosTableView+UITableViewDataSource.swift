//
//  PhotosTableView+UITableViewDataSource.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import UIKit

extension PhotosTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.nibName, for: indexPath) as! PhotoTableViewCell
        let image = images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
}
