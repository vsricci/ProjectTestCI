//
//  Article.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class ArticleList: Decodable {
    var articles: [Article]?
    
    convenience init(articles: [Article]?) {
        self.init()
        self.articles = articles
    }
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let articles = try container.decode([Article].self, forKey: .articles)
        self.init(articles: articles)
    }
}

class Article: Decodable {
    
    var title: String?
    var description: String?
    
    convenience init(title: String?, description: String?) {
        self.init()
        self.title = title
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let title = try container.decode(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)
        self.init(title: title, description: description)
    }
}
