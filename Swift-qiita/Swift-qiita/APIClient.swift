//
//  APIClient.swift
//  Swift-qiita
//
//  Created by massu_fun on 2020/10/11.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient{
    //変数を入れるディクショナリー型宣言
    var items: [[String:String?]] = []
    let baseURL = "https://qiita.com/api/v2/items"
    
    func request(){
        AF.request(baseURL,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
            .response{
                response in
                guard let data = response.data else{return}
                let json = JSON(data)
                json.forEach{(_, json) in
                    let article:[String:String?] = [
                        "title": json["title"].string,
                        "url": json["url"].string,
                        "likes_count": json["likes_count"].string,
                        "userId": json["user"]["id"].string
                    ]
                    self.items.append(article)
                }
            }
    }
}
