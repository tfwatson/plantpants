//
//  Profile.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import Foundation

struct Profile: Codable{
    let id:String
    let fullName:String   //its let because they are not going to be changing. meaning they are constants
    let email:String
    
    
    var initials:String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return""
    }
    let image:String
    var plants: [Plant]
    var pals: [Profile]
    var notifications: [String]
    
}


struct mockData {
    
    static let mockPals: [Profile] = [
        Profile(
            id: "", fullName: "Alice Smith", email: "test@gmail.com",
            image: "profile_image_alice",
            plants: [
                Plant(name: "Cactus", temperature: "Dry", Description: "A resilient cactus.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            id: "", fullName: "Bob Jones", email: "test@gmail.com",
            image: "profile_image_bob",
            plants: [
                Plant(name: "Succulent", temperature: "Moderate", Description: "A low-maintenance succulent.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            id: "", fullName: "Jimmy Jones", email: "test@gmail.com",
            image: "profile_image_alice",
            plants: [
                Plant(name: "Cactus", temperature: "Dry", Description: "A resilient cactus.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            id: "", fullName: "Billy Jean", email: "test@gmail.com",
            image: "profile_image_bob",
            plants: [
                Plant(name: "Succulent", temperature: "Moderate", Description: "A low-maintenance succulent.")
            ],
            pals: [],
            notifications: []
        ),
        
    ]
    
    static let mockProfile: Profile = Profile(
        id: "", fullName: "John Doe", email: "test@gmail.com",
        image: "profile_image",
        plants: [
            Plant(name: "Rose", temperature: "Moderate", Description: "A beautiful red rose."),
            Plant(name: "Lily", temperature: "Warm", Description: "A lovely white lily."),
            Plant(name: "Fern", temperature: "Cool", Description: "A green fern for your home."),
            Plant(name: "Rose", temperature: "Moderate", Description: "A beautiful red rose."),
            Plant(name: "Lily", temperature: "Warm", Description: "A lovely white lily."),
            Plant(name: "Fern", temperature: "Cool", Description: "A green fern for your home."),
            Plant(name: "Rose", temperature: "Moderate", Description: "A beautiful red rose."),
            Plant(name: "Lily", temperature: "Warm", Description: "A lovely white lily."),
            Plant(name: "Fern", temperature: "Cool", Description: "A green fern for your home."),
            Plant(name: "Rose", temperature: "Moderate", Description: "A beautiful red rose."),
            // Add more plants as needed
        ],
        pals: mockPals,
        notifications:["Notification 1", "Notification 2","Notification 3","Notification 4","Toast 5"]
    )
    
}
