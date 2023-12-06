//
//  HomeView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 01/12/2023.
//

import SwiftUI


enum Tabs: Int {
    case home = 0
    case profile = 1
}

struct TabBarView: View {
    
    @Binding var selectedTab : Tabs
    var body: some View {
        HStack (alignment: .center){
            
            Button {
                //switch to home
                selectedTab = .home
            } label: {
                
                TabBarButton(buttonText: "Home", imageName: "house", isActive: selectedTab == .home)
            }.tint(Color(.systemGray))
            
            
            Button {
                //take picture button
            } label: {
                VStack(alignment: .center, spacing: 4) {
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32.0, height:32.0)
                    
                    Text("Classify")
                    
                    
                    
                }
            }
            
            Button {
                // switch to profile
                selectedTab = .profile
            } label: {
                TabBarButton(buttonText: "Profile", imageName: "person", isActive: selectedTab == .profile)
            }.tint(Color(.systemGray))
            
        }.frame(height: 84)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
