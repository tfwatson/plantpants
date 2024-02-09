//
//  LoginView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct OptionsView: View {
    @State private var action: Int? = 0
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            NavigationView {
                VStack {
                    VStack{
                        NavigationLink(destination: LogInView(), tag: 1, selection: $action) {}
                        Text("Welcome to")
                            .font(.title2)
                            .bold()
                        Text("PlantPants")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 69))
                            .foregroundStyle(Color("backgroundColor"))
                            .scaledToFit()
                    }
                    Image("babyPlantHello")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .padding(.bottom)
                    LoginSignUpButton(title: "Log In", backgroundColor: Color("backgroundColor"), textColor: Color.white)
                        .onTapGesture {
                            self.action = 1
                        }
                    HStack {
                        Text("New around here? ")
                            .scaledToFit()
                        Text("Sign Up")
                            .foregroundStyle(Color("backgroundColor"))
                            .scaledToFit()
                    }
                }
            }
            
            .padding()
        }
    }
}

#Preview {
    OptionsView()
}


