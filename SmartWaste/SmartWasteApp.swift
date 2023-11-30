//
//  SmartWasteApp.swift
//  SmartWaste
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI
import Firebase

@main
struct SmartWasteApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                
        }
    }
}
