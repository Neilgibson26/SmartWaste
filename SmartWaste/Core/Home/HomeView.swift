//
//  HomeView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 01/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                VStack(alignment: .center){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "camera.viewfinder")
                    Text("take photo")
                }
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "star")
                    Text("Achievements")
                }
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
            }.frame(maxWidth: .infinity)
                .padding(10)
                .overlay( Divider()
                          .frame(maxWidth: .infinity, maxHeight:1)
                          .background(Color(.systemGray)), alignment: .top)
        }
    }
}

#Preview {
    HomeView()
}
