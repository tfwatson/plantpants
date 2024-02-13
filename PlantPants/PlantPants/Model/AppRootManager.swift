//
//  RootManager.swift
//  PlantPants
//
//  Created by Zeke Reyes on 2/9/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    enum eAppRoots {
        case splash
        case home
    }
}
