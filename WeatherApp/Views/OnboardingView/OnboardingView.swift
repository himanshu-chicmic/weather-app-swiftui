//
//  OnboardingView.swift
//  WeatherApp
//
//  Created by Himanshu on 4/4/23.
//

import SwiftUI

struct OnboardingView: View {
    
    // EnvironmentObject for router class
    @EnvironmentObject var router: Router<Path>
    
    var body: some View {
        VStack{
            
            // onboarding image
            Image("onboard image")
                .resizable()
                .frame(height: 240)
            
            // onboarding headling
            Text(Constants.onboardingHeadline)
                .fontWeight(.bold)
                .font(.title3)
                .padding(.bottom, 6)
                
            // onboarding caption
            Text(Constants.onboardingCaption)
                .font(.system(size: 13))
                .fontWeight(.light)
            
            // action button to go to next view
            Button(action: {
                
                router.push(.SelectCityView)
                
            }, label: {
                
                Image(systemName: Constants.nextIcon)
                    .padding()
                    .padding(.horizontal, 2)
                    .background(.blue.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(100)
                
            }).padding()
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
