//
//  AddPucturesViewController.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 15/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import UIKit

class AddPucturesViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var imageViewPicture: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    let bdManager: DBManager = DBManagerRealm()
    private var imageModel: ImageModel = ImageModel()
    private var offset: Int = 0
    private var imagePictures: Data = Data()
    private var keywordPictures: String = String()
    private var urlPictures: String = String()
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        findPicture(keyword: "Kittens")

        // Do any additional setup after loading the view.
    }
    
    func findPicture(keyword: String) {
        Search(keyword: keyword, offset: self.offset){ (image,url) in
            self.imageViewPicture.image = UIImage(data: image)
            self.imagePictures = image
            self.keywordPictures = keyword
            self.urlPictures = url
        }
    }
    
    @IBAction func addPictures(_ sender: Any) {
        if self.imagePictures != Data() {
            self.imageModel.image = imagePictures
            self.imageModel.search = keywordPictures
            self.imageModel.urlString = urlPictures
            bdManager.saveObject(image: self.imageModel)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func nextPicture(_ sender: Any) {
        self.offset += 1
        if let search = searchBar.text, searchBar.text != "" {
            findPicture(keyword: search)
        } else {
            findPicture(keyword: "Kittens")
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.offset = 0
        let text = searchBar.text
        if text != "" {
            findPicture(keyword: text!)
        }
    }
    
}
