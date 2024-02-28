//
//  SigninView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/25/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
        
    var body: some View {
        ZStack{
                VStack {
                    Text("Please Create Account")
                        .bold()
                        .font(.title2)
                    Image("babyPlantOne")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.bottom)
                    
                    InputView(text: $email, placeHolder: "Email")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $fullName, placeHolder: "Full Name")
                    
                    InputView(text: $password, placeHolder: "Password", isSecureField: true)
                    
                    InputView(text: $confirmPassword, placeHolder: "Confirm Password", isSecureField: true)
                    
                    Button{
                        Task {
                            try await viewModel.createUser(email: email, password:password , fullName:fullName)
                        }
                    }label: {
                        AuthenticationButtonView(title: "Sign Up", backgroundColor: Color("backgroundColor"), textColor: Color.white)
                    }
                    
                }
        }.ignoresSafeArea()
    }
}


#Preview {
    SignInView()
}

