//
//  ContentView.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.profileSession != nil {
                HomeView()
            } else {
                OptionsView()
            }
        }
    }
}

#Preview {
    ContentView()
}

