//
//  DetailsNewsViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 13/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class DetailsNewsViewController: UIViewController, DetailsNewView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var articleViewModel : ArticleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        config()
        
    }
    
    func config() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        titleLabel.text = articleViewModel?.title ?? ""
        descriptionLabel.text = articleViewModel?.description ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
