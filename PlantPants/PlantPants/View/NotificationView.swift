//
//  NotificationView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/22/24.
//
import SwiftUI

struct NotificationView: View {
    // Define a variable to hold an array of String values
    var notification: String

    var body: some View {
        HStack {
           Text(notification)
                .dynamicTypeSize(.xLarge)
        }
        .frame(width: 370, height: 130)
        .aspectRatio(contentMode: .fill)
        .dynamicTypeSize(.accessibility3)
        .background(Color("backgroundColor")) // Ensure you have this color in your assets
        .cornerRadius(30)
    }
}

// Preview Provider
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        // Example usage of NotificationView with an array of messages
        NotificationView(notification: "New Alert")
    }
}

