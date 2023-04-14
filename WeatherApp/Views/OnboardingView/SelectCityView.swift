//
//  SelectCityView.swift
//  WeatherApp
//
//  Created by Nitin on 4/4/23.
//

import SwiftUI

struct SelectCityView: View {
    
    // MARK: properties
    
    // text field variables
    @State var userCity = ""
    @State var lat = ""
    @State var lon = ""
    
    // environment object for router class
    @EnvironmentObject var router: Router<Path>
    
    // show alert bool var
    // when set to true alert box is shown
    @State var showAlert = false
    
    // MARK: body
    var body: some View {
        ZStack {
            
            VStack{
                
                // MARK: - top bar
                HStack (alignment: .center){
                    
                    Button(action: {
                        router.pop()
                    }, label: {
                        Image(systemName: Constants.goBackIcon)
                    })
                    
                    Spacer()
                    
                    Text(Constants.selectCityHeadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                }.padding(.bottom, 34)
                
                
                // MARK: - text fields
                Group{
                    
                    TextField(
                        Constants.enterLatitude,
                      text: $lat
                    )
                    
                    TextField(
                        Constants.enterLongitude,
                      text: $lon
                    )
                
                }
                .keyboardType(.numbersAndPunctuation)
                .padding()
                .background(.gray.opacity(0.25))
                .cornerRadius(100)
                
                // MARK: - save button
                Button(action: {
                    
                    // validate inputs
                    Helper().validateInputsAndSetData(instance: self)
                    
                }, label: {
                    Text(Constants.save)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(100)
                })
                .frame(maxWidth: .infinity)
                .padding(.top)
                .disabled(showAlert)
                
                Spacer()
            }.blur(radius: showAlert ? 80 : 0)
            
            // MARK: - alert box
            if showAlert {
                
                CustomAlerts(viewInstance: self)
                .transition(.scale)
                .background(.white)
                .cornerRadius(12)
            }
        }
        .padding()
        .multilineTextAlignment(.center)
        .navigationBarBackButtonHidden(true)
    }
}

struct SelectCityView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCityView()
    }
}
