//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/14/22.
//
import UIKit
import FirebaseStorage

struct ImageUploader{
    static func uploadImage(image: UIImage, completion: @escaping(String) -> ()){
        //upload data for the image, .jpegData just creates jpeg data for it and gives us the ability to compress the image so when we download it from the internet its not huge and takes up a lot of time
        guard let imageData = image.jpegData(compressionQuality: 0.75) else{ return }
        //this will be our uniqure identifier for our images
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData) { metaData, error in
            if let error = error{
                print("DEBUG: Failed to upload image, error: \(error.localizedDescription)")
                return
            }
            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else{ return }
                completion(imageURL)
            }
        }
    }
}

