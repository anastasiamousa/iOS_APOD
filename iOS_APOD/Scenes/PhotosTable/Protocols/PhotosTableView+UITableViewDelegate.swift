//
//  PhotosTableView+UITableViewDelegate.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 10/7/23.
//

import UIKit

extension PhotosTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
