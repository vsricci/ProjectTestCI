//
//  ArticleListViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    
    let articles: [Article]
}
extension ArticleListViewModel {
    
    var numbersOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articles = articles
    }
}
