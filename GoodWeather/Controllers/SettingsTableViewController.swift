//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var settingsViewModel = SettingsViewModel()
    var delegate : SettingsDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.settingsViewModel.units[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as? UITableViewCell {
            
            cell.textLabel?.text = item.displayName
            
            if item == self.settingsViewModel.selectedUnit {
                cell.accessoryType = .checkmark
            }
            return cell
        }
        else {
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // uncheck all cells
        
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsViewModel.selectedUnit = unit
            self.delegate?.settingsDone(vm: self.settingsViewModel)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }

}
extension SettingsTableViewController {
    
    @IBAction func done(_ sender: UIButton) {
        if let delegate = self.delegate {
           
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
