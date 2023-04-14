//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Himanshu on 4/5/23.
//

import SwiftUI

struct WeatherDetails: View {
    
    // @EnvironmentObject of view model class - WeatherAppModel
    @EnvironmentObject var viewModel: WeatherAppModel
    
    @State var title: [String] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if title.count == 0 {
                ProgressView()
                    .padding(.top, 54)
            }else {
                Text(Constants.weatherDetailsTitle)
                    .fontWeight(.bold)
                
                Group{
                    
                    ForEach((0..<$title.count), id: \.self) {i in
                        if i.isMultiple(of: 2) {
                            HStack {
                                
                                WeatherDetailTile(title: $title[i], subtitle: Constants.detailsTitle[i], icon: Constants.icons[i])
                                    .frame(maxWidth: .infinity/2)
                                
                                WeatherDetailTile(title: $title[i+1], subtitle: Constants.detailsTitle[i+1], icon: Constants.icons[i+1])
                                    .frame(maxWidth: .infinity/2)
                                
                            }
                        }
                    }
                    
                }
                .padding(.vertical, 8)
            }
            
        }
        .padding()
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                Helper().getTitles(instance: self)
            }
        }
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetails()
    }
}
