//
//  NewsCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class NewsCoordinator : Coordinator {
    
    var factory: NewsModuleFactory
    var router: Router
    
    init(router: Router, factory: NewsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showNews()
    }
    
    func showNews() {
        let newsOutput = factory.makeNews()
        
        newsOutput.onItemSelected = { [ weak self] in
            self?.showSelectedItem()
        }
        router.setRootModule(newsOutput)
    }
    
    func  showSelectedItem() {
       
        print("teste")
    }
    
    
}
