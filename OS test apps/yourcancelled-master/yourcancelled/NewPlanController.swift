//
//  newplan.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import Foundation
import UIKit
import FirebaseMessaging
import FirebaseFirestore

class NewPlanController: UIViewController {
    @IBOutlet weak var planField: UITextField!
    @IBOutlet weak var friendField: UITextField!
    
    @IBOutlet weak var username_label: UILabel!
    
    @IBAction func Savepressed(_ sender: Any) {
        if (planField.text == nil || friendField.text == nil || planField.text!.isEmpty || friendField.text!.isEmpty) {
            // prompt error
            showMessage(message: "cant leave the plan name or friend blank")
        } else {
            friendField.text! = friendField.text!.trimmingCharacters(in: .whitespaces)
            
            if (friendField.text!.lowercased() == User.shared!.username!.lowercased()) {
                showMessage(message: "bruhhh. y u so mean. NOT ALLOWED 🙅‍♂️")
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .whereField("username", isEqualTo: friendField.text!.lowercased())
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    // Some error occured
                    print(err)
                    showMessage(message: err.localizedDescription)
                    return
                } else if querySnapshot!.documents.count < 1 {
                    // bad username
                    // alert & re-show
                    DispatchQueue.main.async {
                        showMessage(message: "friend doesnt exist")
                    }
                    return
                } else {

                    print("saving...")
                    Plan.addPlan(name: self.planField.text!, friend: self.friendField.text!.lowercased(), completionHandler: {returnVal,id  in
                        if returnVal {
                            notifyFriend(with: self.friendField.text!, message: self.planField.text!, dataa: ["doc_id": id!])
                        } else {
                            showMessage(message: "something bad happened")
                            return
                        }
                        self.navigationController?.popViewController(animated: true)
                    })
                    
                }
                
            }
            

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        
        username_label.text = "your username is \(User.shared?.username ?? "UNKNOWN. fml. km")"
        
    }
    
}

