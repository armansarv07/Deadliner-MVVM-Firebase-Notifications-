//
//  User.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import Foundation
import Firebase
import FirebaseAuth


struct User {
    let uid: String
    let email: String
    
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email!
    }
    
}
