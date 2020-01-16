//
//  Network.swift
//  TestPicturesYandex
//
//  Created by Вадим Пустовойтов on 15/01/2020.
//  Copyright © 2020 Вадим Пустовойтов. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

func Search(keyword: String, offset: Int, completion: @escaping (Data, String) -> Void ) {
    let subscriptionKey = "5c1001ef52ab425ea82adbd951093ab7"
    let escapedString = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    
    let strUrl = "https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=\(escapedString)&count=1&offset=\(offset)&subscription-key=\(subscriptionKey)"
    
    Alamofire.request(strUrl).responseJSON { (response) in
        
        if response.result.isSuccess {
            let searchResult : JSON = JSON(response.result.value!)
            
            // To-Do: handle image not found
            
            let imageResult = searchResult["value"][0]["contentUrl"].string!
            
            print(imageResult)
            
            Alamofire.request(imageResult).responseData(completionHandler: { (response) in
                if response.result.isSuccess {
                    //let image = UIImage(data: response.result.value!)
                    completion(response.result.value!, imageResult)
                }
                else
                {
                    print("Image Load Failed! \(response.result.error ?? "error" as! Error)")
                }
            })
        }
        else{
            print("Bing Search Failed! \(response.result.error ?? "error" as! Error)")
        }
    }
}
