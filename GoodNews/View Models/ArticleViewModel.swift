//
//  ArticleViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
extension ArticleViewModel {
    var title: String {
        return self.article.title ?? ""
    }
    var description: String {
        return self.article.description ?? ""
    }
}
