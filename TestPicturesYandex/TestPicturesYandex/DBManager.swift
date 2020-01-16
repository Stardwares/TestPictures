//
//  DBManager.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 15/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import Foundation
import RealmSwift

protocol DBManager {
    func saveObject(image: ImageModel)
    func getImages() -> [ImageModel]
    func deleteObject(image: ImageModel)
}

class DBManagerRealm: DBManager {
    
    fileprivate var mainRealm = try! Realm(configuration: .defaultConfiguration)
    
    func saveObject(image: ImageModel) {
        
        try! mainRealm.write {
            mainRealm.add(image)
            print("ADD")
        }
    }
    
    func getImages() -> [ImageModel] {
        
        let images = mainRealm.objects(ImageModel.self)
        
        return Array(images)
    }
    
    func deleteObject(image: ImageModel) {
        
        try! mainRealm.write {
            mainRealm.delete(image)
        }
    }
    
}
