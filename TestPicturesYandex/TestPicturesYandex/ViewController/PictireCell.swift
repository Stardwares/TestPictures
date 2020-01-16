//
//  PictireCell.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 16/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import UIKit

class PictireCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    func initCell(picture: ImageModel) {
        pictureView.image = UIImage(data: picture.image)
        findLabel.text = "Поисковой запрос: " + picture.search
        urlLabel.text = "URL: " + picture.urlString
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
