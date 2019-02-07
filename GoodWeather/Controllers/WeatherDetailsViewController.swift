//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 03/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel : WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let weatherVM = self.weatherViewModel {
//            self.cityNameLabel.text = weatherVM.name.value
//            self.currentTemperatureLabel.text = weatherVM.main.temperature?.value.formatAsDegree
//            self.maxTempLabel.text = weatherVM.main.temperatureMax?.value.formatAsDegree
//            self.minTempLabel.text = weatherVM.main.temperatureMin?.value.formatAsDegree
//        }
        
        setupVMBindings()
    }
    
    private func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name?.bind { self.cityNameLabel.text = $0 }
            weatherVM.main?.temperature?.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
            weatherVM.main?.temperatureMax?.bind { self.maxTempLabel.text = $0.formatAsDegree }
            weatherVM.main?.temperatureMin?.bind { self.minTempLabel.text = $0.formatAsDegree }
        }
        
        // change the value after few seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.weatherViewModel?.name.value = "Boston"
//        }
    }
}
