//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 04/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    let cellIdentifier : String
    var items: [ViewModel]
    let configureCell: (CellType,ViewModel) -> ()
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else { fatalError("Cell with identifier \(cellIdentifier) not found")}
        
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        return cell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
}
