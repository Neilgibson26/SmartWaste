//
//  InputView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        
        if isSecureField {
            SecureField("Password", text: $text)
                .padding()
                .frame(width:300, height:50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }   else    {
            TextField(placeholder, text: self.$text)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
            }
        }
    }

#Preview {
    InputView(text: .constant(""), placeholder: "username")
}


