//
//  PicturesTableViewController.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 15/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import UIKit

class PicturesTableViewController: UITableViewController {
    
    let bdManager: DBManager = DBManagerRealm()
    var images: [ImageModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
 
        updateTable()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateTable()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPicture", for: indexPath) as! PictireCell

        let image: ImageModel = images[indexPath.row]
        
        cell.initCell(picture: image)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.bdManager.deleteObject(image: images[indexPath.row])
            self.updateTable()
        }
    }
    
    func updateTable() {
        if bdManager.getImages() != [] {
            images = bdManager.getImages()
        }
        tableView.reloadData()
    }
}
