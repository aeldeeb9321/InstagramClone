//
//  AuthService.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/14/22.
//

import UIKit
import FirebaseAuth
import Firebase

struct AuthCredentials{
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}
struct AuthService{
    static func registerUser(withCredential credentials: AuthCredentials){
        print("DEBUG: Credentials are \(credentials)")
    }
}
