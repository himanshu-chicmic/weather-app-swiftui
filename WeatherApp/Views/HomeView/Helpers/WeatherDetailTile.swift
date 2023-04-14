//
//  WeatherDetailTile.swift
//  WeatherApp
//
//  Created by Himanshu on 4/5/23.
//

import SwiftUI

struct WeatherDetailTile: View {
    
    // MARK: properties
    @Binding var title: String
    @State var subtitle: String
    @State var icon: String
    
    // MARK:  body
    var body: some View {
        HStack{
            // icon
            Image(systemName: icon)
                .frame(width: 24, height: 24)
                .padding(10)
                .background(.gray.opacity(0.35))
                .cornerRadius(1000)
            
            // title (weather data metrics) and subtitle
            VStack (alignment: .leading){
                
               Text(subtitle)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                
            }
            Spacer()
        }
    }
}

