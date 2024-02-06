//
//  HomeProfileView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/5/24.
//

import SwiftUI

struct HomeProfileView: View {
    var userName: String
    var userProfilePicture: String

    var body: some View {
        HStack {
            // Displaying the user's name
            Text("Hello, \(userName)")
                .font(.headline)
                .padding(.leading, 8)
            
            // Displaying the user's profile picture
            Image(userProfilePicture)
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            Spacer()
        }
        .frame(width: 370, height: 130)
        .aspectRatio(contentMode: .fill)
        .dynamicTypeSize(.accessibility3)
        .background(Color("backgroundColor")) // Ensure you have this color in your assets
        .cornerRadius(30)
    }
}

// Preview
struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView(userName: "Andrew Gonzales", userProfilePicture: "UserProfilePicture")
    }
}
