//
//  FetchAPI.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import Foundation

/**
    FetchAPI - fetches the api key
 */
class FetchAPI {
    
    /**
     * gets the api key from Info.plist
     *
     - @Returns: String.
     */
    func fetchAPIKey() -> String {
        if let apikey = Bundle.main.infoDictionary?[Constants.weather_api] as? String {
            return apikey
        }
        return ""
    }
    
}
