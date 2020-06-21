//
//  User.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/5/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class User {
    
    var uid: String
    
    var username: String? = nil
    
    var name: String
    
    var email: String
    
    //var token: String? = nil
    
    static var shared: User? = nil
    
    let db = Firestore.firestore()

    init(name: String?, email: String?) {
        
        self.uid = Auth.auth().currentUser!.uid

        if let n = name {
            self.name = n
        } else {
            self.name = "??"
        }
        
        if let e = email {
            self.email = e
        } else {
            self.email = "??"
        }
    }
    
    func completeUserLoad(completionHandler: @escaping () -> ()) {
        self.addToDB(uid: uid, name: name, email: email)
        loadFromDB(uid: uid, completionHandler: completionHandler)
                
        InstanceID.instanceID().instanceID { (result, error) in
          if let error = error {
            print("Error fetching remote instance ID: \(error)")
          } else if let result = result {
            print("Remote instance ID token: \(result.token)")
            let token = result.token
            self.modifyDB(token: token) {}
          }
        }
        
    }
    
    func loadFromDB(uid: String, completionHandler: @escaping () -> ()) {
        self.name = "techie_guy"
        self.email = ""
        self.username = "techie_guy"
        completionHandler()

        /*db.collection("users")
        .whereField("uid", isEqualTo: uid)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                // Some error occured
                print(err)
                completionHandler()
            } else if querySnapshot!.documents.count != 1 {
                // impossible
                completionHandler()
            } else {
                let document = querySnapshot!.documents.first!
                let data = document.data()
                self.name = data["name"]! as! String
                self.email = data["email"]! as! String
                if let u = data["username"] as? String {
                    self.username = u
                }
                completionHandler()
            }
        }*/
    }
    
    func addToDB(uid: String, name: String, email: String) {
        
        // Add a second document with a generated ID.
        db.collection("users")
        .whereField("uid", isEqualTo: uid)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                // Some error occured
                print(err)
            } else if querySnapshot!.documents.count == 0 {
                
                self.db.collection("users").addDocument(data: [
                    "uid": uid,
                    "name": name,
                    "email": email,
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                       // print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
    }
    
    func modifyDB(name: String? = nil, email: String? = nil, username: String? = nil, token: String? = nil, completionHandler: @escaping () -> ()) {
        
        var update: [String:String] = [:]
        
        if let n = name {
            update["name"] = n
        }
        
        if let e = email {
            update["email"] = e
        }
        
        if let u = username {
            update["username"] = u.lowercased()
        }
        
        if let t = token {
            update["token"] = t
        } else {
            update["token"] = nil
        }
        
        db.collection("users")
        .whereField("uid", isEqualTo: uid)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                // Some error occured
                print(err)
                completionHandler()
            } else if querySnapshot!.documents.count != 1 {
                // impossible
                completionHandler()
            } else {
                let document = querySnapshot!.documents.first!
                document.reference.updateData(update)
                completionHandler()
            }
        }
        
    }

}
