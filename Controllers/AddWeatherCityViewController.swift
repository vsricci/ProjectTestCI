//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 30/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit


protocol AddWeatherDelegate {
    func addWeatherDidSave(vm : WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()

    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }
    @IBOutlet weak var stateNameTextField: BindingTextField! {
        didSet {
            stateNameTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipCodeNameTextField: BindingTextField! {
        didSet {
            zipCodeNameTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }
    
    
    var weatherDelegate : AddWeatherDelegate? = nil
    
    @IBAction func saveButtonPressed() {
        
        print(self.addCityViewModel)
        if let cityName = cityNameTextField.text {
            city = cityName
            let weatherURL = URL(string: urlString)!
            print(weatherURL)
            
            let extractedExpr = Resource<WeatherViewModel>(url: weatherURL) { data in

                let weather = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weather
            }
            let weatherResource = extractedExpr
            Webservice().load(resouce: weatherResource) { result in
                if let weatherVM = result {
                    if let delegate = self.weatherDelegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    

   
}
