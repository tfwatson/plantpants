//
//  PlantCardView.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import SwiftUI

struct PlantCardView: View {
    let givenPlant:Plant
    var body: some View {
        VStack {
            VStack {
                Text(givenPlant.name)
                    .dynamicTypeSize(.accessibility1)
            }
            HStack {
                Image(systemName: "thermometer")
                    .font(.system(size: 27))
                    .scaledToFit()
                Image(systemName: "battery.100")
                    .font(.system(size: 27))
                    .scaledToFit()
                Image(systemName: "arrow.forward.circle")
                    .font(.system(size: 27))
                    .scaledToFit()
            }
            .frame(width: .infinity, height: .infinity)
        }
        .frame(width: 190, height: 100)
        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        .dynamicTypeSize(.accessibility3)
        .background(Color("backgroundColor"))
        .cornerRadius(30)
        
    }
}


struct AddPlantCardView: View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle")
                .font(.system(size: 27))
                .scaledToFit()
            Text("Add Plant")
                .dynamicTypeSize(.accessibility1)
        }
        .frame(width: 190, height: 100)
        .aspectRatio(contentMode: .fill)
        .dynamicTypeSize(.accessibility3)
        .background(Color(.gray)).opacity(0.6)
        .cornerRadius(30)
    }
}


#Preview {
    PlantCardView(givenPlant: mockData.mockProfile.plants[1])
}
