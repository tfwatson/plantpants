import SwiftUI

// Defining a temporary struct for plant species to parse API response
struct PlantSpecies: Decodable, Identifiable {
    let id: String
    let name: String
}

// Add a function to fetch plants from the API
func fetchPlants(apiKey: String, completion: @escaping ([PlantSpecies]) -> Void) {
    var allPlants = [PlantSpecies]()
    var currentPage = 1
    // Just place holder here the plant api loads 3000 results with current tier
    let lastPage = 10
    
    func fetchPage(page: Int) {
        let url = URL(string: "https://perenual.com/api/species-list?page=\(page)&key=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle response error
            if let error = error {
                print("Error: \(error)")
                return
            }
            // Handle no data
            guard let data = data else {
                print("No data received")
                
                return
            }
            // Otherwise parse the json file
            do {
                let decoder = JSONDecoder()
                let fetchedPlants = try decoder.decode([PlantSpecies].self, from: data)
                allPlants.append(contentsOf: fetchedPlants)
                
                if currentPage < lastPage {
                    currentPage += 1
                    fetchPage(page: currentPage)
                } else {
                    completion(allPlants)
                }
            }
            // Handle JSON decoding error
            catch {
                print("Error decoding JSON: \(error)")
                
            }
        }
        task.resume()
    }
    
    fetchPage(page: currentPage)
}

struct PlantDetailsView: View {
    @State private var plantName: String = ""
    @State private var plantType: String = ""
    @State private var isLoading: Bool = false
    @State private var plantDetails: PlantDetails? = nil
    @State private var isShowingPlantInformation = false
    @State private var action: Int? = 0
    
    let apiKey = "sk-EZhl65e15b11294f84414"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Plant Information").foregroundColor(.pink)) {
                    TextField("Plant Name", text: $plantName)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(5)
                    TextField("Plant Type (e.g. Succulent, Fern)", text: $plantType)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(5)
                }

                Section {
                    
                    Button(action: fetchPlantDetails) {
                        HStack {
                            if isLoading {
                                ProgressView()
                            }
                            Text("Find Plant Details")
                        }
                    }
                    .disabled(plantName.isEmpty || plantType.isEmpty)
                }
            }
            .navigationBarTitle("Add Plant Details", displayMode: .inline)
        }
        .background(
            EmptyView() // Adjust this part according to your actual requirements
        )
        .alert(item: $plantDetails) { details in
            if plantDetails != nil {
                return Alert(
                    title: Text("\(plantName) The \(plantDetails!.commonName)"),
                    message: Text("Watering: \(plantDetails!.watering)\nSunlight: \(plantDetails!.sunlight)"),
                    dismissButton: .default(Text("OK")) {
                        action = 1
                    }
                )
            } else {
                return Alert(title: Text("Error"), message: Text("Failed to fetch plant details."), dismissButton: .default(Text("OK")))
            }
        }

    }
    
    func fetchPlantDetails() {
        isLoading = true
        // Call the global function using its full name including the module name
        PlantPants.fetchPlants(apiKey: apiKey) { plants in
            // Handle fetched plants here just print them for rn
            print(plants)
            self.isLoading = false
        }
    }
}

// Dummy function to simulate network request - replace with actual API request logic
func fetchDetailsFromAPI(completion: @escaping (PlantDetails?) -> Void) {
    // Simulate network delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let details = PlantDetails(commonName: "Boston Fern", watering: "Weekly", sunlight: "Indirect light")
        completion(details)
    }
} 

struct PlantDetails: Identifiable {
    let id = UUID()
    let commonName: String
    let watering: String
    let sunlight: String
}

struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsView()
    }
}
