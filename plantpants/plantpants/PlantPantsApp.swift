//
//  PlantPantsApp.swift
//  PlantPants
//
//  Created by Andrew Julian Gonzales on 2/5/24.
//

import SwiftUI
import FirebaseCore


@main
struct PlantPantsApp: App {
//    @StateObject var viewModel = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            ContentView().environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("Firebase Configuration Complete")

    return true
  }
}

