//
//  OptionsView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            NavigationView {
                VStack {
                    VStack{
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
                    
                    NavigationLink{
                        LogInView()
                    }label: {
                        AuthenticationButtonView(title: "Log In", backgroundColor: Color("backgroundColor"), textColor: Color.white)
                    }
                    
                        
                    HStack {
                        Text("New around here? ")
                            .scaledToFit()
                            .foregroundColor(.black)
                        NavigationLink{
                            SignUpView()
                        }label: {
                            Text("Sign Up")
                                .foregroundStyle(Color("backgroundColor"))
                                .scaledToFit()
                        }
                        
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



