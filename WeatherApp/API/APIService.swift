//
//  APIService.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import Foundation

/**
    APIService - contains methods for getting data from the api endpoint
 */
class APIService {
    
    // static constant object of APIService
    static let shared = APIService()
    
    // constant object of FetchAPI
    let fetchApi = FetchAPI()

    /**
     * gets the weather data from the api endpoint
     *
     - @Parameters: Double, Double, @escaping (Result<WeatherData, Error>) -> Void.
     */
    func getWeatherData(lat: Double, lon: Double, completion: @escaping (Result<WeatherData, Error>) -> Void){
        
        let key = FetchAPI().fetchAPIKey()
        let url = "\(Constants.open_weather)lat=\(lat)&lon=\(lon)&appid=\(key)&units=metric"
        
        guard let url = URL(string: url) else {
            completion(.failure(Constants.invalidURL as! Error))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                }catch let error {
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
