//
//  Profile.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import Foundation
struct Profile: Hashable, Identifiable{
    let id = UUID()
    let name:String   //its let because they are not going to be changing. meaning they are constants
    let image:String	
    var plants: [Plant]
    var pals: [Profile]
    var notifications: [String]
}


struct mockData {
    
    static let mockPals: [Profile] = [
        Profile(
            name: "Alice Smith",
            image: "profile_image_alice",
            plants: [
                Plant(name: "Cactus", temperature: "Dry", Description: "A resilient cactus.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            name: "Bob Jones",
            image: "profile_image_bob",
            plants: [
                Plant(name: "Succulent", temperature: "Moderate", Description: "A low-maintenance succulent.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            name: "Jimmy Jones",
            image: "profile_image_alice",
            plants: [
                Plant(name: "Cactus", temperature: "Dry", Description: "A resilient cactus.")
            ],
            pals: [],
            notifications: []
        ),
        Profile(
            name: "Billy Jean",
            image: "profile_image_bob",
            plants: [
                Plant(name: "Succulent", temperature: "Moderate", Description: "A low-maintenance succulent.")
            ],
            pals: [],
            notifications: []
        ),
        
    ]
    
    static let mockProfile: Profile = Profile(
        name: "John Doe",
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
        notifications:["toast 1", "Toast 2","Toast 3","Toast 4","Toast 5"]
    )
    
}
