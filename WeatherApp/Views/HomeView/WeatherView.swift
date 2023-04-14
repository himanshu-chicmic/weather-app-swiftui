//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import SwiftUI

struct WeatherView: View {
    
    // @EnvironmentObject of view model class - WeatherAppModel
    @EnvironmentObject var viewModel: WeatherAppModel
    
    private let dateTime = DateAndTime()
    
    @State var iconScale: CGFloat = 0
    
    var body: some View {
        VStack{
            
            Spacer()
            
            if let data = viewModel.weatherData {
                
                VStack (alignment: .leading){
                    
                    Text("\(Int(data.main?.temp ?? 0))°")
                        .fontWeight(.heavy)
                        .font(.system(size: 74))
                        .opacity(0.8)
                        .padding(.bottom, -20)
                    
                    HStack{
                        
                        Text("\(data.weather?[0].description?.capitalized ?? Constants.defaultDescription)")
                            .fontWeight(.semibold)
                        
                        Image(Helper().getIcon(icon: data.weather?[0].icon ?? "01d"))
                            .resizable()
                            .frame(width: 44, height: 44)
                            .scaleEffect(iconScale)
                            .onAppear{
                                withAnimation{
                                    iconScale = 1
                                }
                            }
                                
                        
                        Spacer()
                        
                        Text("↓\(Int(data.main?.temp_min ?? 0))° / ↑\(Int(data.main?.temp_max ?? 0))°")
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
