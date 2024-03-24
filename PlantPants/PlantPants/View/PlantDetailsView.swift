import SwiftUI

struct PlantDetailsView: View {
    @State private var plantName: String = ""
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
        fetchDetailsFromAPI { details in
            self.plantDetails = details
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
