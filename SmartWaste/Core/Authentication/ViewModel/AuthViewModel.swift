//
//  AuthViewModel.swift
//  SmartWaste
//
//  Created by Neil Gibson on 20/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
            
        } catch {
            print("Error logging in \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, firstname: String, lastname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user  //starts user session which brings us to logged in views
            let user = User(id: result.user.uid, firstname: firstname, lastname: lastname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create this user with error \(error.localizedDescription)")
        }
    }
//    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
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil //logs out user, brings back to log-in
            self.currentUser = nil //resets currentuser
        } catch {
            print("Failed to sign out")
        }
    }
    
    func deleteAccount() {
        let user = Auth.auth().currentUser

        user?.delete { error in
          if let error = error {
              print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
          } else {
              self.userSession = nil
              self.currentUser = nil
          }
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try?  snapshot.data(as: User.self)
        
//        print("DEBUG: Current user is \(self.currentUser)")
    }
}
