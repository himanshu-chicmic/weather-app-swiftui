//
//  HomeView.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: properties
    private var dateTime = DateAndTime()
    
    // @StateObject of view model class - WeatherAppModel
    @StateObject private var viewModel = WeatherAppModel()
    
    // properties for animating image view - Birds
    @State var birdsPoitionx: CGFloat = -100
    @State var birdsPoitiony: CGFloat = 100
    @State var birdsScale: CGFloat = 200
    
    // MARK: methods
    /**
     * sets the properties of birds image view
     * - birdsPositionx
     * - birdsPositiony
     * - birdsScale
     *
     - @Parameters: CGFloat, CGFloat, CGFloat
     */
    func setBirdProperties(x: CGFloat, y: CGFloat, scale: CGFloat) {
        birdsPoitionx = x
        birdsPoitiony = y
        birdsScale = scale
    }
    
    // MARK: body
    var body: some View {
        VStack{
            if viewModel.weatherData != nil {
                
                // MARK: - scroll view
                
                ScrollView(showsIndicators: false){
                
                
                // MARK: - main weather view
                ZStack{
                    
                    // bottom full image
                    Image(dateTime.checkCurrentTimeGreeting(timezone: viewModel.weatherData?.timezone ?? 0))
                        .resizable()
                        .frame(height: 540)
                    
                    // Birds - animating view image
                    Image("birds")
                        .resizable()
                        .frame(width: birdsScale, height: birdsScale)
                        .position(x: birdsPoitionx, y: birdsPoitiony)
                        .onAppear{
                            withAnimation{
                                if dateTime.checkTime(viewModel.weatherData?.timezone ?? 0) {
                                    setBirdProperties(x: 500, y: 400, scale: 10)
                                }
                                else {
                                    setBirdProperties(x: -100, y: 100, scale: 200)
                                }
                            }
                        }
                        .animation(.linear(duration: 30).repeatForever(autoreverses: false), value: birdsScale)
                        
                    // top image removed bacgkround
                    Image(
                        (
                            dateTime.checkTime(viewModel.weatherData?.timezone ?? 0)
                        ) ? "main image day" : "main image night"
                        
                    )
                        .resizable()
                        .frame(height: 540)
                    
                    // MARK: - weather view details
                    WeatherView().padding(.vertical, 28)
                        .background(.black.opacity(0.25))
                        .foregroundColor(.white)
                }
                    
                    // MARK: - weather details (metrics and other info)
                    WeatherDetails()
                }
                .ignoresSafeArea()
                .overlay(alignment: .top){
                    // MARK: - appbar on the z stack
                    AppBar()
                        .padding()
                        .foregroundColor(.white)
                }
                
                
            }else {
                if viewModel.error == "" {
                    ProgressView()
                }else {
                    Text(viewModel.error)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(viewModel)
        .onAppear{
            UIScrollView.appearance().bounces = false
            // setting data when view appears
            viewModel.setData()
            
            if dateTime.checkTime(viewModel.weatherData?.timezone ?? 0) {
                setBirdProperties(x: -100, y: 100, scale: 200)
            }
            else {
                setBirdProperties(x: 500, y: 400, scale: 10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
