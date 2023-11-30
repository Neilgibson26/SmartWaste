//
//  User.swift
//  SmartWaste
//
//  Created by Neil Gibson on 20/11/2023.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    
    
    
    
    var initials: String {
        let fullname = self.firstname + " " + self.lastname
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
        
        
        
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, firstname: "Lebron", lastname: "James", email: "lbj@lakers.com")
}
