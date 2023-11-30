//
//  RegistrationView.swift
//  SmartWaste
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image("green")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 200, height:150).padding(10)

            RegisterInputView(text: $email, title: "Email Address", placeholder: "name@example.com")
            
            RegisterInputView(text: $firstname, title: "First Name", placeholder: "eg. John")
            RegisterInputView(text: $lastname, title: "Last Name", placeholder: "eg. Doe")
            RegisterInputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
            RegisterInputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail:email,
                                                   password:password,
                                                   firstname:firstname,
                                                   lastname:lastname
                    )
                }
            } label : {
                HStack {
                    Text("SIGN UP")            .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        
                }
            }
            Spacer()

//            
            Button{
                dismiss()
            }   label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in").fontWeight(.bold)
                }.font(.system(size: 16))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
