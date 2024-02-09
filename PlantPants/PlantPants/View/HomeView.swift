//
//  HomeView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        let button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Prev Controller", for: .normal)
            button.layer.cornerRadius = 7
            return button
        }()
        
        
        
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())]
            
            
            
            HStack {
                Text("MyPlants")
                    .bold()
                    .font(.title)
                Spacer()
                
            }.padding(.top)
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns, spacing: 10) {
                        ForEach((0...mockData.mockProfile.plants.count), id: \.self) { index in
                            if index < mockData.mockProfile.plants.count {
                                PlantCardView(givenPlant: mockData.mockProfile.plants[index])
                            } else {
                                AddPlantCardView()
                            }
                                            }
                    }.frame(height: 210)
                }
            }
            .frame(width:.infinity, height: 213)
        
        
    }
    
    
}



#Preview {
    HomeView()
}


// AddPlantCardView struct for the add button
// Easy

