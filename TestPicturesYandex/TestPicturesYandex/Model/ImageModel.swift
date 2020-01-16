//
//  ImageModel.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 15/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class ImageModel: Object {
    
    dynamic var urlString: String = String()
    dynamic var image: Data = Data()
    dynamic var search: String = String()
    
}
