//
//  AuthService.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/14/22.


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
    //In firestore we have multiple collections. A collection contains a bunch of documents, a document contains multiple field(or attributes). To register a user we created a users collection, then created a document with the uid as the document identifier, then we are uploading user information to that document uid
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> ()){
        //before we sign the user up we need to get the download url for their profile photo
        //image uploader will uupload the image and when its done we will have access to the imageUrl as long as no errors come back
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password){ result, error in
                if let error = error{
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                //through the result object we have access to the uid for the user created
                guard let uid = result?.user.uid else{ return }
                let data : [String: Any] = ["email": credentials.email,
                                            "fullname": credentials.fullname,
                                            "profileImageUrl": imageUrl,
                                            "uid": uid,
                                            "username": credentials.username]
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                
            }
        }
    }
}
