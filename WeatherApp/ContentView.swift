//
//  ContentView.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: properties
    
    // boolean value to check if the location is selected
    private let isLocationSelected = UserDefaults.standard.bool(forKey: Constants.currentLocation)
    
    
    @ObservedObject var router = Router<Path>()
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            if isLocationSelected {
                HomeView()
                    .navigationDestination(for: Path.self) {
                        path in
                        switch path {
                            case .OnboardingView: OnboardingView()
                            case .SelectCityView: SelectCityView()
                            case .HomeView: HomeView()
                        }
                    }
            }else {
                OnboardingView()
                    .navigationDestination(for: Path.self) {
                        path in
                        switch path {
                            case .OnboardingView: OnboardingView()
                            case .SelectCityView: SelectCityView()
                            case .HomeView: HomeView()
                        }
                    }
            }
        }.environmentObject(router)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
