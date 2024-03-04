//
//  PlantInformationView.swift
//  PlantPants
//
//  Created by Zeke Reyes on 3/1/24.
//

import SwiftUI

<<<<<<< HEAD
struct UserPlant {
    var imageName: String
    var nickname: String
    var typeName: String
    var wateringFrequency: String // e.g., "Every 2 days"
    var sunlightRequirement: String // e.g., "Partial shade"
}
=======
//struct UserPlant {
//    var imageName: String
//    var nickname: String
//    var typeName: String
//    var wateringFrequency: String // e.g., "Every 2 days"
//    var sunlightRequirement: String // e.g., "Partial shade"
//}
>>>>>>> plant-details


struct PlantInformationView: View {
    var plant: UserPlant

    var body: some View {
        ScrollView {
            //
            VStack(spacing: 0) {
                Image(plant.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(plant.nickname)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Divider()
                    
<<<<<<< HEAD
                    Text("Type: \(plant.typeName)")
                        .padding(.horizontal)
                    
                    Text("Watering Frequency: \(plant.wateringFrequency)")
                        .padding(.horizontal)
                    
                    Text("Sunlight Requirement: \(plant.sunlightRequirement)")
                        .padding(.horizontal)
=======
                    HStack {
                        //
                        Text("Type: \(plant.typeName)")
                    }.padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "drop.fill")
                            .foregroundColor(.blue)
                        Text("Watering Frequency: \(plant.wateringFrequency)")
                    }.padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.yellow)
                        Text("Sunlight Requirement: \(plant.sunlightRequirement)")
                    }.padding(.horizontal)
>>>>>>> plant-details
                    
                    // Add more information here as needed
                    
                    Spacer()
                }
                .padding(.vertical)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.1)) // Background color for the entire screen
        .navigationBarTitle(Text("Plant Information"), displayMode: .inline)
    }
}

<<<<<<< HEAD
#Preview {
    PlantInformationView(plant: UserPlant(imageName: "PlantImage/fern", nickname: "Timmy", typeName: "Ficus", wateringFrequency: "Every 2 days", sunlightRequirement: "Partial shade"))
}

=======
struct ContentView: View {
    var body: some View {
        PlantInformationView(plant: UserPlant(imageName: "PlantImage/fern", nickname: "Timmy", typeName: "Ficus", wateringFrequency: "Every 2 days", sunlightRequirement: "Partial shade"))
    }
}


>>>>>>> plant-details
struct PlantInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PlantInformationView(plant: UserPlant(imageName: "fern", nickname: "Timmy", typeName: "Boston Fern", wateringFrequency: "Every week", sunlightRequirement: "Partial shade"))
    }
}
<<<<<<< HEAD


=======
>>>>>>> plant-details
