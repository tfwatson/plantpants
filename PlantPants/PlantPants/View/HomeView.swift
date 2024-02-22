import SwiftUI

/**
 Maybe have multiple shades of green and brown, then have pastel pink for highlighting, and shading
 */
struct HomeView: View {
    var body: some View {
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        NavigationView {
            VStack(spacing: 0) {
                // Custom NavigationBarView at the top
                NavigationBarView(title: "PLANTPANTS") {
                    print("notifications")
                }

                // Main content in ScrollView
                ScrollView {
                    // User Profile and Name
                    HomeProfileView(userName: "Andrew Gonzales", userProfilePicture: "default")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(mockData.mockProfile.notifications, id: \.self) { notification in
                                NotificationView(notification: notification)
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                    

                    // Title "MyPlants"
                    Text("MyPlants")
                        .bold()
                        .font(.title)
                        .padding(.trailing, 250)
                        .scaledToFit()
                    
                    // ScrollView for plants
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: columns, spacing: 10) {
                            ForEach((0...mockData.mockProfile.plants.count), id: \.self) { index in
                                if index < mockData.mockProfile.plants.count {
                                    PlantCardView(givenPlant: mockData.mockProfile.plants[index])
                                } else {
                                    AddPlantCardView()
                                }
                            }
                        }
                        .frame(height: 210)
                    }
                    .padding(.leading, 9)
                    
                    Text("Plant Pals")
                        .bold()
                        .font(.title)
                        .padding(.trailing, 240)
                        .scaledToFit()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: columns, spacing: 10) {
                            ForEach(mockData.mockProfile.pals, id: \.id) { pal in
                                PalCardView(pal: pal.name)
                            }
                            AddPalCardView()
                        }
                        .frame(height: 210)
                        .padding(.leading, 9)
                    }
                    
                }
            }
        }
        .navigationBarHidden(true) // Hide the default navigation bar
    }
    
    
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
