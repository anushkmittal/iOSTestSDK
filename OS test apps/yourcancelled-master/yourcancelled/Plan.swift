//
//  Plan.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class Plan {
    
    var name: String
    var owners: [String]
    var cancelled_by: [String]
    var done: Bool
    var id: String
    
    static let db = Firestore.firestore()

    init(name: String, owners: [String], cancelled_by: [String], done: Bool, id: String) {
        self.name = name
        self.owners = owners
        self.cancelled_by = cancelled_by
        self.done = done
        self.id = id
    }
    
    static func loadPlans(completionHandler: @escaping (Bool) -> ()) {
        plans = []
        plans.append(Plan(name: "test_plan", owners: ["test_user", "techie_guy"], cancelled_by: [], done: false, id: "322132132212"))
        completionHandler(true)
                
        /*db.collection("plans")
        .order(by: "created", descending: true)
        .whereField("owners", arrayContains: User.shared!.username!)
        .whereField("done", isEqualTo: false)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                // Some error occured
                print(err)
                completionHandler(false)
            } else if querySnapshot!.documents.count < 1 {
                // impossible
                completionHandler(false)
            } else {
                plans = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    plans.append(Plan(name: data["name"] as! String, owners: data["owners"]  as! [String], cancelled_by: data["cancelled_by"]  as! [String], done: data["done"] as! Bool, id: document.documentID))
                }
                completionHandler(true)
            }
        }*/
        
    }
    
    static func getPlan(id: String, completionHandler: @escaping (Plan?) -> ()) {
        
        db.collection("plans").document(id).getDocument { (querySnapshot, err) in
            if err != nil {
                // Some error occured
                completionHandler(nil)
            } else if querySnapshot == nil {
                completionHandler(nil)
            } else {
                let data = querySnapshot?.data()
                let plan = Plan(name: data!["name"] as! String, owners: data!["owners"]  as! [String], cancelled_by: data!["cancelled_by"]  as! [String], done: data!["done"] as! Bool, id: querySnapshot!.documentID)
                completionHandler(plan)
            }
        }
        
    }
    
    
    static func addPlan(name: String, friend: String, completionHandler: @escaping (Bool, String?) -> ()) {
        var ref: DocumentReference? = nil

        ref = self.db.collection("plans").addDocument(data: [
            "owners": [friend, User.shared!.username!],
            "cancelled_by": [],
            "done": false,
            "name": name,
            "created": Timestamp(date: Date())
        ]) {err in
            if let err = err {
                print("Error adding document: \(err)")
                completionHandler(false, nil)
            } else {
               // print("Document added with ID: \(ref!.documentID)")
                completionHandler(true, ref!.documentID)
            }
        }
        
    }
    
    static func modifyDB(plan: Plan, completionHandler: @escaping (Bool) -> ()) {
        db.collection("plans").document(plan.id).getDocument { (querySnapshot, err) in
            if let err = err {
                // Some error occured
                print(err)
                completionHandler(false)
            } else if querySnapshot == nil {
                completionHandler(false)
            } else {
                querySnapshot!.reference.updateData([
                    "owners": plan.owners,
                    "cancelled_by": plan.cancelled_by,
                    "done": plan.done,
                    "name": plan.name,
                ])
                completionHandler(true)
            }
        }
    }
    
}
