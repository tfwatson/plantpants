//
//  SettingRowView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/26/24.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
}

