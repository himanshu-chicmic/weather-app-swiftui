//
//  DataAndTime.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import Foundation

/**
 DateAndTime - class for date, time and other calendar related functions
 */
class DateAndTime {
    
    /**
     * gets the current data and time
     * format - EEE, MMMM d (ex. Tue, Apr 4)
     *
     - @Parameters: Int
     - @Returns: String.
     */
    func getCurrentDataAndTime(timezone: Int) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        
        if timezone != 0 {
            dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        }
        
        let dateCur = Date()
        
        let date = dateFormatter.string(from: dateCur)
        
        return date
    }
    
    /**
     * check current hour and returns the greeting (i.e. Good Morning, Afternoon, Evening & Night)
     *
     - @Parameters: Int
     - @Returns: String.
     */
    func checkCurrentTimeGreeting(timezone: Int) -> String {
        let date = getCurrentDataAndTime(timezone: timezone)
        let hour = Calendar.current.component(.hour, from: DateFormatter().date(from: date) ?? Date())
        
        switch hour {
            case 4..<12:
                return Constants.goodmorning
            case 12..<18:
                return Constants.goodafternoon
            case 18..<22:
                return Constants.goodevening
            default:
                return Constants.goodnight
        }
    }
    
    /**
     * check current time morning afternoon evening or night and returns a bool value
     * - morning, afternoon - true
     * - evening, night - false
     *
     - @Parameters: Int
     - @Returns: Bool.
     */
    func checkTime(_ timezone: Int) -> Bool {
        
        return (checkCurrentTimeGreeting(timezone: timezone) == Constants.goodmorning)
        || (checkCurrentTimeGreeting(timezone: timezone) == Constants.goodafternoon)
        
    }
}
