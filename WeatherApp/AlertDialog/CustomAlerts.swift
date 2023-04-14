//
//  CustomAlerts.swift
//  CodeNinja
//
//  Created by Himanshu on 3/22/23.
//

import SwiftUI

/**
 CustomAlerts - custom alerts view for showing error and warnings
 */
struct CustomAlerts: View {
    
    // SelectCityView instance to show alert dialog on the instance's view
    var viewInstance: SelectCityView?
    
    var body: some View {
        VStack {
            // image view
            Image(CustomAlertModel.alertImage)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 28)
                .padding(.bottom, 14)

            Spacer()
            
            // alert title
            Text(CustomAlertModel.alertTitle)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            Spacer()
            
            // alert message
            Text(CustomAlertModel.alertText)
                .fontWeight(.light)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .padding(.horizontal)
            
            Spacer()
            
            Divider()
                .padding(.horizontal)
            
            // action button
            Button(action: {
                if let viewInstance = viewInstance {
                    withAnimation{
                        viewInstance.showAlert.toggle()
                    }
                }
            }, label: {
                Text(CustomAlertModel.alertButtonText)
                    .frame(maxWidth: .infinity)
            })
            .padding(.bottom, 20)
            .padding(.top, 4)
            
            
        }
        .frame(width: UIScreen.main.bounds.width-50, height: 240)
        .background(.gray.opacity(0.25))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.25), radius: 20)
    }
}

struct CustomAlerts_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlerts()
    }
}
