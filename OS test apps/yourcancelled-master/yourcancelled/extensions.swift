//
//  extensions.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/5/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import Foundation
import UIKit

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


func resetDefaults() {
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
        defaults.removeObject(forKey: key)
    }
}

// Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: Array<Character> =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}


// MARK: UIApplication extensions

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

func showAlert(title: String, message: String) {
        // create the alert
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
    alert.addAction(UIAlertAction(title: "k", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
    UIApplication.getTopViewController()!.present(alert, animated: true, completion: nil)
}

extension Array where Element: Equatable {
    func contains(array: [Element]) -> Bool {
        for item in array {
            if !self.contains(item) { return false }
        }
        return true
    }
}

// MARK:- messaging
import FirebaseFirestore

func sendPushNotification(to token: String, title: String, body: String, dataa: [String: String]? = nil) {
        let urlString = "https://fcm.googleapis.com/fcm/send"
        let url = NSURL(string: urlString)!
        let paramString: [String : Any] = ["to" : token,
                                           "notification" : ["title" : title, "body" : body],
                                           "data" : dataa as Any
                                          ]
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAANURfdvQ:APA91bEzrMwSWdBwGRwColyPwJBrNBCX-gbaCmajEbbebwjPJiW5oCONy-sHVNsyhBapMOomuHkif4s3wbAOYduICljTObPFsh-6celpUZPJWc_OsPp27N09S1MBdUNILh45ed45jbna", forHTTPHeaderField: "Authorization")
        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Received data:\n\(jsonDataDict))")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    
}


func notifyFriend(with username: String, message: String, dataa: [String: String]? = nil) {
    let db = Firestore.firestore()
    db.collection("users")
    .whereField("username", isEqualTo: username)
    .getDocuments() { (querySnapshot, err) in
        if let err = err {
            // Some error occured
            print(err)
        } else if querySnapshot!.documents.count != 1 {
            // impossible
        } else {
            let document = querySnapshot!.documents.first!
            let data = document.data()
            if let token = data["token"] as? String {
                sendPushNotification(to: token, title: "you've got mail", body: "plan: " + message, dataa: dataa)
            } else {
                showMessage(message: "friend doesnt have notification. let em know or not")
            }
        }
    }
}

//import SwiftMessages
import Toast_Swift

func showMessage(message: String) {

    // basic usage
    UIApplication.getTopViewController()?.view.window?.makeToast(message)
  
}

import StoreKit

enum AppStoreReviewManager {
  static let minimumReviewWorthyActionCount = 4

  static func requestReviewIfAppropriate() {
    
    var actionCount = UserDefaults.standard.integer(forKey: "appreviewcount")
    actionCount += 1
    UserDefaults.standard.set(actionCount, forKey: "appreviewcount")
    
    let shown = UserDefaults.standard.bool(forKey: "appreview_show")


    guard actionCount >= minimumReviewWorthyActionCount else {
      return
    }

    if shown {
        return
    }
    
    SKStoreReviewController.requestReview()
    
    let windowCount = UIApplication.shared.windows.count
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.8) {
        if windowCount < UIApplication.shared.windows.count {
            // trigerred
            UserDefaults.standard.set(true, forKey: "appreview_show")
        }
    }
    
  }
    
}
