//
//  TableViewController.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import AnushkTestSDK

var plans: [Plan] = []

class TableViewController: UITableViewController {
    
    let refreshControll = UIRefreshControl()

    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func signOutPressed(_ sender: Any) {
        print("sign out pressed")
        signOut = true
        do {
            try Auth.auth().signOut()
        } catch let err {
            print(err)
        }
        
        plans = []
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "first")
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        print("add pressed")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "new_plan")
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Plans
        Plan.loadPlans { (returnVal) in
             DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControll.endRefreshing()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if  (User.shared!.username != nil) {
            refreshWeatherData(self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        tableView.refreshControl = refreshControll
        refreshControll.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)

        User.shared?.completeUserLoad {
            if (User.shared != nil && User.shared!.username != nil) {
                Plan.loadPlans { (returnVal) in
                    self.tableView.reloadData()
                }
            } else if (User.shared != nil && User.shared!.username == nil) {
                self.setUsername()
            }
        }
        
        if #available(iOS 13.0, *) {
        } else {
            // + button hides
            addButton.setImage(UIImage(named: "icons8-plus_math_filled"), for: .normal)
            addButton.accessibilityLabel = "add"
            addButton.setTitle("add", for: .normal)
        }
        
        AppStoreReviewManager.requestReviewIfAppropriate()
        
        AnushkTestSDKManager.shared.login(applicationID: "com.memeois.yourcancelled", //get from plist
                                      allowScreenshots: true, //log screenshots
                                      logAllTouches: true,
                                      showButton: true,
                                      enableConsoleLogging: false, // debug / verbose
                                      saveScreenshotsLocally: true) // saving to file locally
        
    }

    func setUsername() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Username?", message: "u make plans w username. something something privacy.", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [alert] (_) in
                
            let textField = alert.textFields![0] // Force unwrapping because we know it exists.
            
            print("Text field: \(textField.text!)")
            
            textField.text! = textField.text!.trimmingCharacters(in: .whitespaces)
            
            if (textField.text!.isEmpty) {
                DispatchQueue.main.async {
                    alert.message = "username cant be blank. try gain."
                    UIApplication.getTopViewController()!.present(alert, animated: true, completion: nil)
                }
                return
            }
            
            User.shared?.modifyDB(username: User.shared?.username, completionHandler: {
                
                //need to verify that username be unique
                let db = Firestore.firestore()
                db.collection("users")
                    .whereField("username", isEqualTo: textField.text!.lowercased())
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        // Some error occured
                        print(err)
                    } else if querySnapshot!.documents.count >= 1 {
                        // bad username
                        // alert & re-show
                        DispatchQueue.main.async {
                            alert.message = "username already exists. try gain."
                            UIApplication.getTopViewController()!.present(alert, animated: true, completion: nil)
                        }
                    } else {
                        User.shared!.username = textField.text!.lowercased()
                        User.shared!.modifyDB(username: User.shared!.username) {
                            Plan.loadPlans { (returnVal) in
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            })

        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { [alert] (_) in
            //showMessage(message: "")
            DispatchQueue.main.async {
                alert.message = "pls dont cancel. cant work w/o username. type here:"
                UIApplication.getTopViewController()!.present(alert, animated: true, completion: nil)
            }
        }))

        // 4. Present the alert.
        UIApplication.getTopViewController()!.present(alert, animated: true, completion: nil)
    }
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let friend_name = (plans[indexPath.row].owners.filter {$0 != User.shared!.username!}).first!
        cell.textLabel!.text = plans[indexPath.row].name + " (\(friend_name))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "edit_plan") as! EditPlanViewController
        newViewController.modalPresentationStyle = .fullScreen
        
        let friend_name = (plans[indexPath.row].owners.filter {$0 != User.shared!.username!}).first!
        newViewController.title = plans[indexPath.row].name + " (\(friend_name))"
        
        newViewController.plan = plans[indexPath.row]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let plan = plans.remove(at: indexPath.row)
            tableView.reloadData()
            plan.done = true
            Plan.modifyDB(plan: plan) { (bool) in
                if bool {
                    showMessage(message: "deleted")
                } else {
                    showMessage(message: "something bad happened.")
                }
            }
        }
    }
    
}
