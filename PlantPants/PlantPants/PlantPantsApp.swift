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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Group {
                OptionsView()
            }
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
