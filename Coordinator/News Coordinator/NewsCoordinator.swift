//
//  NewsCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class NewsCoordinator : Coordinator, DetailsNewsCoordinatorOutput {
    var isFinished: (() -> Void)?
    
    
    var factory: NewsModuleFactory
    
    var router: Router
    var mainCoordinator: CoordinatorFactory
    
    init(router: Router, factory: NewsModuleFactory, mainCoordinator: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.mainCoordinator = mainCoordinator
    }
    
    override func start() {
        showNews()
    }
    
    func showNews() {
        let newsOutput = factory.makeNews()
        
        newsOutput.onItemSelected = { [ weak self] articleSelected in
            
            self?.showSelectedItem(article: articleSelected)
        }
    
        
        
        router.setRootModule(newsOutput)
    }
    
    
    func  showSelectedItem(article: ArticleViewModel) {
    
        let detailsOutput = factory.makeADetailsNewsView(article: article)
        router.push(detailsOutput, animated: true, hideBottomBar: true, completion: nil)
    }
    
    
    
    
}
