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
    @State var selectedTab : Tabs = .home

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                DisplayView(selectedTab: $selectedTab)
                Spacer()
                TabBarView(selectedTab: $selectedTab)
                
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
