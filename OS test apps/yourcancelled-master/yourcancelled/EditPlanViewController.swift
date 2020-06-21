//
//  EditPlanViewController.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/6/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import UIKit
import SwiftyGif
import SAConfettiView

class EditPlanViewController: UIViewController {

    var plan: Plan? = nil
    
    let cancelButton = UIButton(type: .custom)
    let cancelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let confettiLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    @IBOutlet var waitingImageView: UIImageView!
    @IBOutlet weak var waiting_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        waiting_label.isHidden = true
        waitingImageView.isHidden = true
        updateState()
    }
    
    func updateState() {
        if (plan!.cancelled_by.contains(User.shared!.username!) // plan is cancelled by me
            && !plan!.cancelled_by.contains(array: (plan?.owners.filter {$0 != User.shared!.username!})!) // plan not cancelled by friend
            ) {
            // waiting
            showWaiting()
        } else if (!plan!.cancelled_by.contains(User.shared!.username!)) { // plan is not cancelled by me
            showCancel()
        } else if (plan!.cancelled_by.contains(User.shared!.username!))  // plan is cancelled by me
            && plan!.cancelled_by.contains(array: (plan?.owners)!) { // plan cancelled by friend too
            showConfetti()
        }
    }
    
    func showCancel() {
        self.waitingImageView.isHidden = true
        self.waiting_label.isHidden = true
        self.confettiLabel.removeFromSuperview()
        // Do any additional setup after loading the view.
        cancelButton.frame = CGRect(x: 160, y: 100, width: 200, height: 200)
        cancelButton.layer.cornerRadius = 0.5 * cancelButton.bounds.size.width
        cancelButton.clipsToBounds = true
        cancelButton.setImage(UIImage(named:"circle.png"), for: .normal)
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        cancelButton.center = view.center
        view.addSubview(cancelButton)
        
        cancelLabel.center = view.center
        cancelLabel.textAlignment = .center
        cancelLabel.text = "cancel"
        cancelLabel.textColor = .white
        cancelLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        self.view.addSubview(cancelLabel)
    }
    
    func showWaiting() {
        self.cancelLabel.removeFromSuperview()
        self.cancelButton.removeFromSuperview()
        self.waiting_label.isHidden = false
        self.waitingImageView.isHidden = false

        do {
            let gif = try UIImage(gifName: "waiting.gif")
            waitingImageView = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
            waitingImageView.frame = CGRect(x: 160, y: 100, width: 200, height: 200)
            waitingImageView.center = view.center
            view.addSubview(waitingImageView)
        } catch {
            print(error)
        }
    }
    
    func showConfetti() {
        self.cancelLabel.removeFromSuperview()
        self.cancelButton.removeFromSuperview()
        self.waitingImageView.isHidden = true
        self.waiting_label.isHidden = true

        confettiLabel.center = view.center
        confettiLabel.textAlignment = .center
        
        if traitCollection.userInterfaceStyle == .light {
            confettiLabel.textColor = .black
            print("Light mode")
        } else {
            confettiLabel.textColor = .white
            print("Dark mode")
        }
        
        confettiLabel.text = "CANCELLED!!"
        confettiLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        self.view.addSubview(confettiLabel)
        
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.startConfetti()
    }
    
    @objc func cancelPressed() {
        print("cancel button pressed")
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
        plan?.cancelled_by.append(User.shared!.username!)
        self.updateState()
        
        // notify the other owner about this plan
        // case1: i am the one who cancels. she gets a notification that allows her to canncel
        // case2: i am the one who confirms cancels. she gets a notification that allows her to see confetti
        notifyFriend(with: ((plan?.owners.filter {$0 != User.shared!.username!})?.first!)!,
                     message: plan!.name,
                     dataa: ["doc_id": plan!.id])
        
        Plan.modifyDB(plan: plan!) { (returnVal) in
            if (!returnVal) {
                showAlert(title: "error", message: "something bad happened. i made this app in a day so idk")
            } else {
               // self.updateState()
            }
        }
    }

}
