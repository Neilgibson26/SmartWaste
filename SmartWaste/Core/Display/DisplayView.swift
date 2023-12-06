//
//  DisplayView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 06/12/2023.
//

import SwiftUI

struct DisplayView: View {
    
    @Binding var selectedTab : Tabs
    var body: some View {
        
        if selectedTab == .home {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        } else {
            ProfileView()
        }
    }
}

#Preview {
    DisplayView(selectedTab: .constant(.profile))
}
