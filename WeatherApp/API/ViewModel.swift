//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import Foundation
import CoreLocation

/**
    WeatherAppModel - class that interacts with the api endpoint and fetches the data and update views on data change in @Published var weatherData
 */
class WeatherAppModel: ObservableObject {
    
    // @Published variable of the weatherData
    @Published var weatherData: WeatherData?
    
    // @Published variable of the weatherData
    @Published var error: String = ""
    
    /**
     * default initializer. sets the weatherData with lat: 56.34 and lon: 34.12 when object is created
     */
    init() {
        setData()
    }
    
    /**
     * sets the lat and lon
     * after checking the user defaults
     * and call the getWeatherData method
     *
     */
    func setData() {
        // boolean value to check if the location is selected
        let isLocationSelected = UserDefaults.standard.bool(forKey: Constants.currentLocation)
        
        var lat = 30.2110
        var lon = 74.9455
        
        // if location is selected already
        // get from the user defaults
        if isLocationSelected {
            let latString = UserDefaults.standard.string(forKey: "lat") ?? "30.2110"
            let lonString = UserDefaults.standard.string(forKey: "lon") ?? "74.9455"
            
            lat = Double(latString)!
            lon = Double(lonString)!
        }
        
        getWeatherData(lat: lat, lon: lon)
    }
    
    /**
     * gets the weather data from the api endpoint and stores in weatherData var if success
     *
     - @Parameters: Double, Double.
     */
    func getWeatherData(lat: Double, lon: Double) {
        APIService.shared.getWeatherData(lat: lat, lon: lon){ [weak self] response in
            switch response {
            case .success(let result):
                self?.weatherData = result
            case.failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
 
}
