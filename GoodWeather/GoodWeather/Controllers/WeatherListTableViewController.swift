//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 30/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit
class WeatherListTableViewController: UITableViewController {

    var weather: [Temperature] = [Temperature]()
    var weatherListViewModel = WeatherListViewModel()
   // private var datasource: WeatherDataSource?
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //self.datasource = WeatherDataSource(self.weatherListViewModel)
        self.datasource = TableViewDataSource(cellIdentifier: "WeatherCell", items: self.weatherListViewModel.weatherViewModels, configureCell: { cell, viewModel in
            
                cell.configure(vm: viewModel)
        })
        self.tableView.dataSource = self.datasource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.addWeatherSegue.rawValue {
            
            prepareSegueForAddWeatherViewController(segue: segue)
            
        }else if segue.identifier == Segues.settingsSegue.rawValue {
            
            prepareSegueSettingsTableViewController(segue: segue)
        
        }else if  segue.identifier == Segues.weatherDetailsSegue.rawValue {
            
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
        
    }
    
    private func prepareSegueForAddWeatherViewController(segue: UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        addWeatherCityVC.weatherDelegate = self
    }
    
    private func prepareSegueSettingsTableViewController(segue: UIStoryboardSegue) {
    
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        settingsVC.delegate = self
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue){
        
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController, let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
   
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.datasource.updateItems([vm])
        self.weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        print("selected delegate...")
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}
