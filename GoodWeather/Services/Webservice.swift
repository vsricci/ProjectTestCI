//
//  Webservice.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

struct Resource<T> {
    
    let url: URL
    let parse: (Data) -> T?
    
}

final class Webservice {
    func load<T>(resouce: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resouce.url) { (data, response, error) in
            print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                     completion(resouce.parse(data))
                }
            }else {
                completion(nil)
            }
        }.resume()
    }
}
