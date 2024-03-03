//
//  LogInView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//
//
/*
 Model: is like a object/Datatype
 View: display/UI (Stupid)
 ModelView: is what handles the data, to display
 */
import SwiftUI

struct LogInView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Text("Welcome Back, Please Log In")
                        .bold()
                        .font(.title2)
                    Image("babyPlantOne")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.bottom)
                    InputView(text: $email, placeHolder: "Email")
                    InputView(text: $password, placeHolder: "password", isSecureField: true)
                    
                    Button {
                        Task {
                            try await viewModel.signIn(email: email, password: password)
                        }
                    }label: {
                        AuthenticationButtonView(title: "Log In", backgroundColor: Color("backgroundColor"), textColor: Color.white)
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0:0.5)
                    
                }

            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }

    }
}

extension LogInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LogInView()
}



