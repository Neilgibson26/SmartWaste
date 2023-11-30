//
//  RegisterInputView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI

struct RegisterInputView: View {
    @Binding var text: String
    
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ) {
            Text(title).foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField("Password", text: $text)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .autocapitalization(.none)
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
}

#Preview {
    RegisterInputView(text:.constant(""), title:"Email Address", placeholder: "name@example.com")
}
