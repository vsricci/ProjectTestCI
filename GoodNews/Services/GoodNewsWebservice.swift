//
//  Webservice.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class GoodNewsWebservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        print(url.absoluteString)
        
        AF.request(url).responseJSON { ( response) in
            switch response.result {
                case .success:
                    print(response.data)
                    do {
                        let articleList = try JSONDecoder().decode(ArticleList.self, from: response.data!)
                        completion(articleList.articles)
                    }
                    catch {}
                
            case .failure(let error):
                    print(error.localizedDescription)
                completion(nil)
            }
        }
        
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil)
//            }else if let data = data {
//                print(data)
//                do {
//                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
//                        completion(articleList.articles)
//                }
//                catch {}
//            }
//        }.resume()
    }
}
