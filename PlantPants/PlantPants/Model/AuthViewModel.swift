//
//  AuthViewModel.swift
//  PlantPants
//  Source: https://www.youtube.com/watch?v=QJHmhLGv-_0&t=4980s
//  Created by Andrew Julian Gonzales on 2/27/24.
//
import SwiftUI
import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestoreInternalWrapper
import FirebaseFirestore

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}

//View is going to obser changes on the viewModel (Observable Object)
@MainActor
class AuthViewModel: ObservableObject {
    @Published var profileSession: FirebaseAuth.User? //firebase user
    @Published var currentProfile: Profile? //data model
    
    init(){
        self.profileSession = Auth.auth().currentUser
        Task{
            await fetchProfile()
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.profileSession = result.user
            await fetchProfile()
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    }
    
    /*
        asyncrounous function that could potentially throw and error
        create a user using firebase code
     */
    func createUser(email:String, password:String, fullName:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.profileSession = result.user
            let user = Profile(id: result.user.uid, fullName: fullName, email: email, image: "", plants: [], pals: [], notifications: [])
            let endcodedUser =  try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("Users").document(user.id).setData(endcodedUser)
            await fetchProfile()
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut() //sign out on user backend
            self.profileSession = nil //wipes out user session and us back to login screen
            self.currentProfile = nil //wipes out current user datamodel
        } catch {
            print("DEBUG: Faild to Sign Out")
        }
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchProfile() async{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("Users").document(uid).getDocument() else {return}
        self.currentProfile = try? snapshot.data(as: Profile.self)
//        print("DEBUG: Current user is \(self.currentProfile)")
    }
}

