//
//  APIModel.swift
//  PlantPants
//
//  Created by Zeke Reyes on 3/27/24.
//

import Foundation // Import Foundation for DispatchQueue

class PlantViewModel: ObservableObject {
    @Published var plants = [PlantSpecies]()
    
    func fetchPlants(apiKey: String) {
        // Call the global function to fetch plants
        PlantPants.fetchPlants(apiKey: apiKey) { plants in
            DispatchQueue.main.async {
                self.plants = plants
            }
        }
    }
}
