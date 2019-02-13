//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 30/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController, WeatherView {

    var weather: [Temperature] = [Temperature]()
    var weatherListViewModel : WeatherListViewModel?
   // private var datasource: WeatherDataSource?
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.tabBarItem.title = "GoodWeather"
        
        self.weatherListViewModel = WeatherListViewModel()
        self.weatherListViewModel?.addWeatherViewModel(vm:  WeatherViewModel(name: Dynamic<String>("São Paulo"), main: Weather(temperature:  Dynamic<Double>(100.0), temperatureMin:  Dynamic<Double>(69.0), temperatureMax:  Dynamic<Double>(45.7))))
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "GoodWather"
        self.navigationController?.navigationItem.title = "GoodWeather"
        //self.datasource = WeatherDataSource(self.weatherListViewModel)
        self.tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        self.datasource = TableViewDataSource(cellIdentifier: "WeatherCell", items: (self.weatherListViewModel?.weatherViewModels)!, configureCell: { cell, viewModel in

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
        
        let weatherVM = self.weatherListViewModel?.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
   
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.datasource.updateItems([vm])
        self.weatherListViewModel?.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        print("selected delegate...")
        self.weatherListViewModel?.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
}

extension WeatherListTableViewController {
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        self.weatherListViewModel?.weatherCoordinatorDelegate?.next()
    }
}
