//
//  PlantDetailsView.swift
//  PlantPants
//
//  Created by Zeke Reyes on 2/26/24.
//

import SwiftUI

struct PlantDetailsView: View {
    @State private var plantName: String = ""
    @State private var nickName: String = ""
    @State private var plantType: String = ""
    @State private var isLoading: Bool = false
    @State private var plantDetails: PlantDetails? = nil
    @State private var isShowingPlantInformation = false
    @State private var action: Int? = 0
    
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
            NavigationLink(destination: LogInView(), tag: 1, selection: $action) {}
        )
        // This is where we process the stuff we get from the api like watering etc
        .alert(item: $plantDetails) { details in
            //
            Alert(
                title: Text("\(plantName) The \(details.commonName)"),
                message: Text("Watering: \(details.watering)\nSunlight: \(details.sunlight)"),
                dismissButton: .default(Text("OK")) {
                    action = 1
                }
            )
        }
    }
    
    func fetchPlantDetails() {
        // Set loading state
        isLoading = true
        
        // Here you would perform the API request to fetch plant details based on the plantName and plantType
        // Assumes a function `fetchDetailsFromAPI` exists and sets the isLoading to false once data is fetched.
        fetchDetailsFromAPI { details in
            self.plantDetails = details
            self.isLoading = false
        }
    }
}

struct PlantDetails: Identifiable {
    let id = UUID()
    let commonName: String
    let watering: String
    let sunlight: String
}

// Dummy function to simulate network request - replace with actual API request logic
func fetchDetailsFromAPI(completion: @escaping (PlantDetails) -> Void) {
    // Simulate network delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion(PlantDetails(commonName: "Boston Fern", watering: "Weekly", sunlight: "Indirect light"))
    }
}

struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsView()
    }
}


#Preview {
    PlantDetailsView()
}
