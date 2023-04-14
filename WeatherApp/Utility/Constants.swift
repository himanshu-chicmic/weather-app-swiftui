//
//  Constants.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import Foundation

/**
 Constants - struct contains global constant strings
 */
struct Constants {
    
    // MARK: - api key, url
    static let weather_api = "WEATHER_API_KEY"
    static let open_weather = "https://api.openweathermap.org/data/2.5/weather?"
    static let open_weather_forecast = "https://api.openweathermap.org/data/2.5/forecast?"
    
    // MARK: - api responses
    static let success = "Success"
    static let invalidURL = "Unable to Generate URL"
    static let invalidData = "Failed to Load Data"
    
    // MARK: - user defaults keys
    static let currentLocation = "currentLocation"
    static let lat = "lat"
    static let lon = "lon"
    
    // MARK: - app greetings
    static let goodmorning = "Good Morning"
    static let goodafternoon = "Good Afternoon"
    static let goodevening = "Good Evening"
    static let goodnight = "Good Night"
    
    // MARK: - app onboarding
    static let onboardingHeadline = "Everything About The Weather At A Glance"
    static let onboardingCaption = "This application will display accurate weather of your current location based on openweathermap.org"
    
    // MARK: - select city view
    static let selectCityHeadline = "Select Your City 🏡"
    static let enterLatitude = "Enter latitude"
    static let enterLongitude = "Enter longitude"
    
    // MARK: - default icon
    static let nextIcon = "chevron.right"
    static let goBackIcon = "arrow.left"
    static let menuIcon = "line.3.horizontal"
    static let addCityIcon = "plus"
    
    // MARK: - default data
    static let defaultLocation = "Unknown"
    static let defaultWeatherIcon = "01d"
    static let defaultDescription = "Couldn't Identify"
    
    // MARK: - weather details view
    static let weatherDetailsTitle = "Weather Details"
    static let detailsTitle: [String] = ["Temperature Felt", "Visibility", "Air Pressure", "Weather Type", "Humidity", "Wind Speed"]
    static let icons: [String] = ["thermometer.medium", "eye", "timer.square", "square.3.layers.3d", "humidity", "wind"]
    
    
    // MARK: - others
    static let save = "Save"
    static let title = "Title"
    static let subtitle = "Subtitle"
    static let dateFormat = "EEE, d MMMM"
    
    // MARK: - alert dialog defaults
    static let alertDefaultTitle = "Invalid Input"
    static let alertDefaultMessage = "Alert Message"
    static let alertDefaultButton = "OK"
    static let alertDefaultIcon = "alerticon"
    
    // MARK: - errors and warnings
    static let errorSpeciaChars = "contains special charaters. Only + - and . are allowed"
    static let errorlatValue = "Incorrect latitude (value must be -90 <= lat <= 90)"
    static let errorlonValue = "Incorrect longitude (value must be -180 <= lat <= 180)"
    static let emptyInput = "Please fill all the input fields."
    
}
