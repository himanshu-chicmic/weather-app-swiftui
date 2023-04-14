//
//  AppBar.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import SwiftUI

struct AppBar: View {
    // data and time instance
    private let dateTime = DateAndTime()
    
    // environment objects
    @EnvironmentObject var router: Router<Path>
    
    // @EnvironmentObject of view model class - WeatherAppModel
    @EnvironmentObject var viewModel: WeatherAppModel
    
    var body: some View {
        HStack{
            
            Image(systemName: "location")
            
            VStack (alignment: .leading){
                if let data = viewModel.weatherData {
                    Text((data.name == "") ? Constants.defaultLocation : data.name ?? Constants.defaultLocation)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(dateTime.getCurrentDataAndTime(timezone: data.timezone ?? 0))
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            // set location
            Image(systemName: "square.and.pencil")
                .frame(width: 34, height: 34)
                .padding(4)
                .background(.gray.opacity(0.25))
                .cornerRadius(1000)
                .onTapGesture {
                    router.push(.SelectCityView)
                }
        }
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar()
    }
}
