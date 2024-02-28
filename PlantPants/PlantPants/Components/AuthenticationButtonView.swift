//
//  LoginSignUpButton.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct AuthenticationButtonView: View {
    let title:String
    let backgroundColor:Color
    let textColor:Color
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 355, height: 50)
            .scaledToFit()
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

#Preview {
    AuthenticationButtonView(title: "Log In", backgroundColor: Color("backgroundColor"), textColor: Color.white)
}

