//
//  NewListTableViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class NewListTableViewController: UITableViewController, NewsView {

    private var articleListViewModel: ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        getArticles()
        self.title = "GoodNews"
        self.navigationController?.navigationItem.title = "GoodNews"
        
    }
    
    private func setup(){

        //tableView.rowHeight = 80.0
        //tableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
//        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }

    private func getArticles() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=0acff59368584c00ac803b0914b77a6b")!
        GoodNewsWebservice().getArticles(url: url) { listArticles in
            if let listArticles = listArticles {
                self.articleListViewModel = ArticleListViewModel(articles: listArticles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numbersOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let article = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        return cell
    }

}
