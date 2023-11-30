//
//  ContentView.swift
//  SmartWasteAI
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI
import Firebase



struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
