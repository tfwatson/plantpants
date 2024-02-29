//
//  ProfileView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/26/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack{
                    Text("AG")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 90)
                        .background(Color("backgroundColor"))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("Andrew Gonzales")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("myemail@usc.edu")
                            .font(.footnote)
                            .accentColor(Color("backgroundColor"))
                        
                            
                    }
                }
                    
            }
            Section("General") {
                HStack{
                    SettingRowView(imageName: "gear", title: "Version", tintColor: Color("backgroundColor"))
                    Spacer()
                    Text("0.0.1")
                        .font(.subheadline)
                        .foregroundColor(Color("backgroundColor"))
                }
                
            }
            Section("Account"){
                Button{
                    print("Sign Out")
                }label: {
                    SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color("backgroundColor"))
                }
                Button{
                    print("Delete Account")
                }label: {
                    SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color("backgroundColor"))
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

