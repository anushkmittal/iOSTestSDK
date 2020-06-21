//
//  ViewController.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
import Firebase

var signOut = false
class ViewController: UIViewController {
    

    
    @objc func handleLogInWithSkip() {
        print("skip pressed")
        
        // Sign in with Firebase.
        Auth.auth().signInAnonymously() { (authResult, error) in
            if (error != nil) {
                // Error. If error.code == .MissingOrInvalidNonce, make sure
                // you're sending the SHA256-hashed nonce as a hex string with
                // your request to Apple.
                print(error!.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else { return }
            
            //let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
            
            let defaults = UserDefaults.standard
            defaults.set(uid, forKey: "uid")
            self.signIn()
            
        }
        
    }
    
    @available(iOS 13.0, *)
    @objc func handleLogInWithAppleID() {
        let nonce = randomNonceString()
        currentNonce = nonce
        UserDefaults.standard.set(nonce, forKey: "nonce")
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)

        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = self
        controller.presentationContextProvider = self
        
        controller.performRequests()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
        
        var appleLogInButton: UIControl? = nil
        if #available(iOS 13.0, *) {
            //appleLogInButton = {
            appleLogInButton = ASAuthorizationAppleIDButton()
            appleLogInButton!.addTarget(self, action: #selector(handleLogInWithAppleID), for: .touchUpInside)
            //  return button
            //}()
        } else {
            // Fallback on earlier versions
        }
        
        var skipLoginButton : UIButton// = {
            skipLoginButton =  UIButton()
            skipLoginButton.addTarget(self, action: #selector(handleLogInWithSkip), for: .touchUpInside)
            //return skipLoginButton
        //}()
        
        if !signOut {
            let user = Auth.auth().currentUser
            if (user != nil) {
              // User is signed in.
              //  print(Auth.auth().currentUser?.displayName)
              signIn(name: Auth.auth().currentUser!.displayName, email: Auth.auth().currentUser!.email)
              return
            }
        }
            
        if #available(iOS 13.0, *) {
            self.view.addSubview(appleLogInButton!)
            appleLogInButton!.frame = CGRect(x: appleLogInButton!.frame.origin.x, y: appleLogInButton!.frame.origin.y, width: appleLogInButton!.frame.width * 1.5, height: appleLogInButton!.frame.height * 1.5)
            appleLogInButton!.center = self.view.center
            
            self.view.addSubview(skipLoginButton)
            skipLoginButton.setup(title: "skip", x: appleLogInButton!.frame.origin.x, y: appleLogInButton!.frame.origin.y, width: appleLogInButton!.frame.width * 1.5, height: appleLogInButton!.frame.height * 1.8)
            skipLoginButton.center = self.view.center + CGPoint(x: 0, y: 60)
            
        } else {
            self.view.addSubview(skipLoginButton)
            skipLoginButton.setup(title: "login", x: view.frame.origin.x, y: view.frame.origin.y, width: 128.0, height: 50.0)
            skipLoginButton.center = self.view.center
        }

        if traitCollection.userInterfaceStyle == .light {
            skipLoginButton.setTitleColor(.black, for: .normal)
            print("Light mode")
        } else {
            skipLoginButton.setTitleColor(.white, for: .normal)
            print("Dark mode")
        }
        
        
    }
    
    func signIn(name: String? = nil, email: String? = nil) {
        print("sign in pressed")
        User.shared = User(name: name, email: email)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tvc") //as! TableViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false)
    }
    
}

@available(iOS 13.0, *)
extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {

        guard currentNonce != nil else {
          fatalError("Invalid state: A login callback was received, but no login request was sent.")
        }
        
        guard let appleIDToken = appleIDCredential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
            
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }
            
        // Initialize a Firebase credential.
        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: currentNonce)
        // Sign in with Firebase.
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if (error != nil) {
                // Error. If error.code == .MissingOrInvalidNonce, make sure
                // you're sending the SHA256-hashed nonce as a hex string with
                // your request to Apple.
                print(error!.localizedDescription)
                return
            }
                // User is signed in to Firebase with Apple.
                // ...
            switch authorization.credential {
                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                    let userIdentifier = appleIDCredential.user
                    var name = ""
                    if let fname = appleIDCredential.fullName?.givenName {
                        if let lname = appleIDCredential.fullName?.familyName {
                            name = fname + " " + lname
                        } else {
                            name = fname
                        }
                    }
                    
                    let email = appleIDCredential.email
                    
                    let defaults = UserDefaults.standard
                    defaults.set(userIdentifier, forKey: "uid")

                    //Save the UserIdentifier somewhere in your server/database
                    self.signIn(name: name, email: email)
                    break
                
                default:
                    break
            }
            
        }
            
    }
        
        
        
  }
}


@available(iOS 13.0, *)
extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
           return self.view.window!
    }
}


extension UIButton {
func setup(title: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat){
    frame = CGRect(x: x, y: y, width: width, height: height)
    setTitle(title , for: .normal)
    }
}

// Declare `-` operator overload function
func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}
