//
//  Helpers.swift
//  WeatherApp
//
//  Created by Himanshu on 4/5/23.
//

import Foundation
import SwiftUI

/**
 Helpers - contains utility methods
 - Methods Included
    - getIcon()
    - setTextMessageAndShowDialog()
    - validateInputAndSetData()
    - getTitles()
 */
class Helper {
    /**
     * returns the icon to be set in the image
     *
     - @Parameters: String.
     - @Returns: String.
     */
    func getIcon(icon: String) -> String {
        var icon = icon
        
        if icon.contains("03") || icon.contains("09")
           || icon.contains("11") || icon.contains("13")
            || icon.contains("50") {
            icon.removeLast()
            return icon
        }

        return icon
    }
    
    /**
     * sets the error message and toggle the showalert to open alert dialog
     *
     - @Parameters: SelectCityView, String.
     */
    func setTextMessageAndShowDialog(instance: SelectCityView, text: String) {
        CustomAlertModel.alertText = text
        withAnimation{
            instance.showAlert.toggle()
        }
    }
    
    /**
     * validates the input from the user (latitude and longitude)
     *
     - @Parameters: SelectCityView.
     */
    func validateInputsAndSetData(instance: SelectCityView) {
        
        let lat = instance.lat.trimmingCharacters(in: .whitespacesAndNewlines)
        let lon = instance.lon.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let regex = "[ !\"#$%&'()*,/:;<=>?@\\[\\\\\\]^_`{|}~]"
        
    
        let latInt = Int(lat) ?? 0
        let lonInt = Int(lon) ?? 0
        
        if (!lat.isEmpty && !lon.isEmpty){
            
            if lat.range(of: regex, options: .regularExpression) != nil {
                setTextMessageAndShowDialog(instance: instance, text: "Latitude \(Constants.errorSpeciaChars)")
            }
            
            else if lon.range(of: regex, options: .regularExpression) != nil {
                setTextMessageAndShowDialog(instance: instance, text: "Longitude \(Constants.errorSpeciaChars)")
            }
            
            else if(latInt >= 90 || latInt <= -90) {
                setTextMessageAndShowDialog(instance: instance, text: Constants.errorlatValue)
            }
            else if(lonInt >= 180 || lonInt <= -180){
                setTextMessageAndShowDialog(instance: instance, text: Constants.errorlonValue)
            }
            
            else {
                UserDefaults.standard.set(instance.lat, forKey: Constants.lat)
                UserDefaults.standard.set(instance.lon, forKey: Constants.lon)
                
                if UserDefaults.standard.bool(forKey: Constants.currentLocation) {
                    instance.router.pop()
                }else {
                    UserDefaults.standard.set(true, forKey: Constants.currentLocation)
                    instance.router.push(.HomeView)
                }
            }
            
        }else {
            setTextMessageAndShowDialog(instance: instance, text: Constants.emptyInput)
        }
    }
    
    /**
     * sets the title array in WeatherDetails view with updated data from weatherData array in ViewModel
     *
     - @Parameters: WeatherDetails.
     */
    func getTitles(instance: WeatherDetails){
        
        instance.title = []
        
        if let data = instance.viewModel.weatherData {
            
            
            let temperatureFelt = "\(Int(data.main?.feels_like ?? 0))°"
            let visibility = "\((data.visibility ?? 0)/1000)km"
            let pressure = "\(data.main?.pressure ?? 0) hPa"
            let weathertype = "\(data.weather?[0].main ?? Constants.defaultDescription)"
            let humidity = "\(data.main?.humidity ?? 0)%"
            let windspeed = "\(data.wind?.speed ?? 0) m/s"
            
            
            instance.title = [temperatureFelt, visibility, pressure, weathertype, humidity, windspeed]
        }
        
    }
}
