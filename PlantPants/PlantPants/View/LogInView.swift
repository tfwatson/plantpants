//
//  LogInView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email:String=""
    @State private var password:String=""
    var body: some View {
        ZStack{
            VStack {
                Text("Welcome Back, Please sign in")
                    .bold()
                    .font(.title2)
                Image("babyPlantOne")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom)
                LoginTextField(placeHolder: "Email", destination: $email)
                LoginTextField(placeHolder: "Password", destination: $password)
                LoginSignUpButton(title: "Log In", backgroundColor: Color("backgroundColor"), textColor: Color.white)
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    LogInView()
}

struct LoginTextField: View {
    let placeHolder:String
    @Binding var destination:String
    
    var body: some View {
        TextField(placeHolder, text: $destination)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 355, height: 50)
            .scaledToFit()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}
