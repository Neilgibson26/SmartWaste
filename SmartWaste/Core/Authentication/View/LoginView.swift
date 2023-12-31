//
//  ContentView.swift
//  SmartWasteAI
//
//  Created by Neil Gibson on 19/11/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                
                VStack {
                    
                    Image("green")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 200, height:200).padding(10)
                    VStack (alignment: .leading, spacing: 10) {
                        
                        Text("Login")
                            .bold()
                            .font(.largeTitle)
                            .padding()
                        
                        InputView(text: self.$email,
                                  placeholder: "email")
                        
                        InputView(text: self.$password,
                                  placeholder: "Password",
                                  isSecureField: true)
                        
                        // Sign in button
                        Button {
                            Task {
                                try await viewModel.signIn(withEmail: email, password: password)
                            }
                        } label : {
                            Text("SIGN IN")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(.blue)
                            .disabled(!formIsValid)
                            .opacity(formIsValid ? 1.0: 0.5)
                            .cornerRadius(10)
                            
                        }
                        
                    }
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label : {
                        HStack {
                            Text("Don't have an account?")
                            Text("Sign up").fontWeight(.bold)
                        }.font(.system(size: 16))
                    }
                    
                }
                

                
            }
        }
    }
}

// validation checks
extension LoginView: AuthenticationFormProtocol {
    
    var formIsValid: Bool {
        return !email.isEmpty 
        && email.contains("@")
        && !password.isEmpty
        && password.count > 6
        
    }
}

#Preview {
    LoginView()
}
