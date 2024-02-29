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
                    Text("Welcome Back, Please sign in")
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
                    
                }

            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }

    }
}

#Preview {
    LogInView()
}



