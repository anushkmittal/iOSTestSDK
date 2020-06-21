//
//  AnushkTestSDK.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 7/8/16.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import Foundation
import UIKit

public class AnushkTestSDK: NSObject {
    
    @objc public var DEBUGGING = false
    @objc public var logAllTouch: Bool = false
    var enableScreenshot: Bool = true
    var saveScreenshotsLocally: Bool = false
    
    var simpleSelectedArray = [String]()
    
    var appID: String = ""
    var manualScreenshots: [Int: UIImage] = [:]
    var showFloatButton: Bool = false
    
    @objc public var dont_log_mode: Bool = false
    @objc public var isAssertValid: Bool = false
    var time_on_init: Int = -1
    
    @objc public var grid: SUPGridWindow? = nil
    @objc public func login (applicationID appID: String, allowScreenshots: Bool = true, logAllTouches: Bool = true, showButton: Bool = true, enableConsoleLogging: Bool = true, saveScreenshotsLocally: Bool = true) {
        
        self.appID = appID
        self.time_on_init = Int(bootTime()!.timeIntervalSinceNow)
        DEBUGGING = enableConsoleLogging
        enableScreenshot = allowScreenshots
        logAllTouch = logAllTouches
        self.showFloatButton = showButton
        
        // perform on the main thread
        DispatchQueue.main.async {
         //   while(UIApplication.shared.keyWindow == nil) {
                //wait for window to be present
          //  }
            //if (UIApplication.shared.keyWindow != nil) {
                if(self.showFloatButton) {
                    self.showFloatingButton()
                }

                self.grid = SUPGridWindow.shared() // delay making this when window is present
                self.grid?.setGridColor(UIColor.blue)
                self.grid?.setMajorGridSize(CGSize(width: 40, height: 40))
                self.grid?.setMinorGridSize(CGSize(width: 10, height: 10))
                self.grid?.toggleHidden()
           // }
        }
        
        self.saveScreenshotsLocally = saveScreenshotsLocally
    }
    
    var actionIDs: [String] = []
    
    var lastLoggers: [AnushkTestSDKLogger] = []
    @objc public func getNewLogger() -> AnushkTestSDKLogger {
        let newLogger = AnushkTestSDKLogger()
        self.lastLoggers.append(newLogger)
        self.simpleSelectedArray = [] // we are now doinng a new action. dont need to remember the choice of last action assertion
        return newLogger
    }
    @objc public func removeLastLogger() {
        _ = self.lastLoggers.removeLast()
    }
    
}

// MARK: FloatyDelegate

extension AnushkTestSDK: FloatyDelegate {
    
    func showFloatingButton() {
        print("AnushkTestSDK float button displayed on screen")
        //let floatyQuad = Floaty()
        Floaty.global.button.accessibilityLabel = "ANUSHKTESTSDK_FLOAT"
        layoutFABforQuadAnimation()
        Floaty.global.button.addDragging()
        Floaty.global.button.openAnimationType = .quadCircular // define animation type
        Floaty.global.button.circleAnimationDegreeOffset = 10 // define offset in degrees
        Floaty.global.button.circleAnimationRadius = 150 // by default is 150
        Floaty.global.button.buttonImage = UIImage(named: "home", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)
        
    }
    
    @objc public func callAddAssertionCheck() {
        // add assertion check was called
        print("add assertion called")
        isAssertValid = false
        dont_log_mode = true
        /*var lastLogger = lastLoggers.last!
        // iterate the list of loggers from back
        for logger in lastLoggers.reversed() {
            // get the last non float button
            if (!logger.isFloatButton) {
                // use it & exit
                lastLogger = logger
                break
            }
        }*/
        //var lastLogger = properties
        let lastLogger = lastLoggers[lastLoggers.count - 1] // get the last
        // note the assumption here being that you always want to assert the element you interacted with last
        /** go on with the completion */
        
        // create a list of properties that can be checked
        var availablePropertyTitle: [String] = ["UI Control: \(lastLogger.isUIControl)"]
        if (lastLogger.isUIControl != "false") {
            availablePropertyTitle.append("Enabled: \(lastLogger.isEnabled)")
            availablePropertyTitle.append("State of the Element: \(lastLogger.stateUIControl)")
            availablePropertyTitle.append("Selected: \(lastLogger.isSelected)")
            availablePropertyTitle.append("Is Highlighted: \(lastLogger.isEnabled)")
            availablePropertyTitle.append("Bounds: \(lastLogger.bounds)")
            availablePropertyTitle.append("Constrains: \(lastLogger.constrains)")
            availablePropertyTitle.append("Tags: \(lastLogger.tags)")
            availablePropertyTitle.append("Accessibility Label: \(lastLogger.accessibilityLabell)")
            availablePropertyTitle.append("Accessibility Frame: \(lastLogger.accessibilityFramee)")
            
            availablePropertyTitle.append("View Details: \(lastLogger.viewDetails)")
            availablePropertyTitle.append("Superview: \(lastLogger.superView)")
            availablePropertyTitle.append("Superview Bounds: \(lastLogger.superViewBound)")
            availablePropertyTitle.append("Superview Tag: \(lastLogger.superViewTag)")
            
            availablePropertyTitle.append("Receiver Subview: \(lastLogger.receiverSubview)")
            availablePropertyTitle.append("Receiver Window: \(lastLogger.receiverWindow)")
            availablePropertyTitle.append("Mask View: \(lastLogger.maskView)")
            
            availablePropertyTitle.append("Touch Type: \(lastLogger.typeOfTouch)")
            availablePropertyTitle.append("Touch Phase: \(lastLogger.uiTouchPhase)")
            availablePropertyTitle.append("No. of Taps: \(lastLogger.tapCount)")
            availablePropertyTitle.append("Force Used: \(lastLogger.maxPossForce)")
            availablePropertyTitle.append("Superview Constrains: \(lastLogger.superViewConstrain)")

        }
        
        // allow the user to tap multiple properties that they can check specific to this UIControl
        let selectionMenu = RSSelectionMenu(selectionType: .Multiple, dataSource: availablePropertyTitle, cellType: .Basic) { (cell, object, indexPath) in
            cell.textLabel?.text = object
        }
        
        selectionMenu.setSelectedItems(items: []) { (text, isSelected, selectedItems) in
            
            // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
            self.simpleSelectedArray = selectedItems
        }
        
        
        // show as popover
        selectionMenu.show(style: .Formsheet, from: UIApplication.topViewController()!)
        
        // send the selection to server
        
    }
    
    @objc public func callAddAssertionLastAction() {
        
        if lastLoggers.count < 2 {
            // we haven't had a last action
            let alertController = UIAlertController(title: "error", message: "this feature is to add assertion on your last action but no action taken so far", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "k", style: .default, handler: nil)
            alertController.addAction(OKAction)
            UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
            return
        }
        
        // we want to get the last logger that contains last action undertaken
        // the absolute last logger is always empty
        // the one before is the last log
        // that can be either an action or an asertion event
        // we can traverse back till we find a non-assertion event
        // or return an error
        // why? because I could have just triggered an assertion event first thing on app launch, and then trying to assert last even when none so exists.
        
        var hash_last = 1 // last one is always empty so start w 2nd last
        var llogger: AnushkTestSDKLogger? = nil
        while (hash_last < lastLoggers.count) {
            let ll = lastLoggers[lastLoggers.count - hash_last - 1]
            if ll.isAnAssertionLog == false { // we found a non assert last event
                llogger = ll
                break;
            }
            hash_last += 1
        }
        
        if llogger == nil {
            // we haven't had a last action
            let alertController = UIAlertController(title: "error", message: "this feature is to add assertion on your last action but only assertion events done so far.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "k", style: .default, handler: nil)
            alertController.addAction(OKAction)
            UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
            return
        }
        
        let lastLogger = llogger!
        
        
        /** go on with the completion */
        // create a list of properties that can be checked
        var availablePropertyTitle: [String] = ["UI Control: \(lastLogger.isUIControl)"]
        if (lastLogger.isUIControl != "false") {
            availablePropertyTitle.append("isEnabled: \(lastLogger.isEnabled)")
            availablePropertyTitle.append("stateUIControl: \(lastLogger.stateUIControl)")
            availablePropertyTitle.append("isSelected: \(lastLogger.isSelected)")
            availablePropertyTitle.append("isEnabled: \(lastLogger.isEnabled)")
            availablePropertyTitle.append("bounds: \(lastLogger.bounds)")
            availablePropertyTitle.append("constrains: \(lastLogger.constrains)")
            availablePropertyTitle.append("tags: \(lastLogger.tags)")
            availablePropertyTitle.append("accessibilityLabell: \(lastLogger.accessibilityLabell)")
            availablePropertyTitle.append("accessibilityFramee: \(lastLogger.accessibilityFramee)")
            
            availablePropertyTitle.append("viewDetails: \(lastLogger.viewDetails)")
            availablePropertyTitle.append("superView: \(lastLogger.superView)")
            availablePropertyTitle.append("superViewBound: \(lastLogger.superViewBound)")
            availablePropertyTitle.append("superViewTag: \(lastLogger.superViewTag)")
            
            availablePropertyTitle.append("receiverSubview: \(lastLogger.receiverSubview)")
            availablePropertyTitle.append("receiverWindow: \(lastLogger.receiverWindow)")
            availablePropertyTitle.append("maskView: \(lastLogger.maskView)")
            
            availablePropertyTitle.append("typeOfTouch: \(lastLogger.typeOfTouch)")
            availablePropertyTitle.append("uiTouchPhase: \(lastLogger.uiTouchPhase)")
            availablePropertyTitle.append("tapCount: \(lastLogger.tapCount)")
            availablePropertyTitle.append("maxPossForce: \(lastLogger.maxPossForce)")
            availablePropertyTitle.append("superViewConstrain: \(lastLogger.superViewConstrain)")
        }
        
        // allow the user to tap multiple properties that they can check specific to this UIControl
        let selectionMenu = RSSelectionMenu(selectionType: .Multiple, dataSource: availablePropertyTitle, cellType: .Basic) { (cell, object, indexPath) in
            cell.textLabel?.text = object
        }
        
        selectionMenu.setSelectedItems(items: self.simpleSelectedArray) { (text, isSelected, selectedItems) in
            
            // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
            self.simpleSelectedArray = selectedItems
        }
        
        
        // show as popover
        selectionMenu.show(style: .Formsheet, from: UIApplication.topViewController()!)
        
        // send the selection to server
        
    }
    
    func layoutFABforQuadAnimation() {
        Floaty.global.button.hasShadow = false
        Floaty.global.button.paddingX = Floaty.global.button.frame.width
        Floaty.global.button.fabDelegate = self
        
        let when = DispatchTime.now() + 1 // delay by 2 seconds

        
        Floaty.global.button.addItem("", icon: UIImage(named: "upload", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)?.withTintColor(.blue)) {item in
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.uploadAction()
            }
        }
        
        Floaty.global.button.addItem("", icon: UIImage(named: "photo", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)?.withTintColor(.blue)) { item in
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.screenshotAction()
            }
        }
        
        Floaty.global.button.addItem("", icon: UIImage(named: "comment", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)?.withTintColor(.blue)) { item in
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.commentAction()
            }
        }
        
        Floaty.global.button.addItem("", icon: UIImage(named: "add", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)?.withTintColor(.blue)) { item in
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.addAction()
            }
            
        }
        
        /*Floaty.global.button.addItem("", icon: UIImage(named: "add", in: Bundle(for: AnushkTestSDK.self), compatibleWith: nil)?.withTintColor(.blue)) { item in
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.callAddAssertionLastAction()
                //self.addAction()
            }
            
        }*/


        //UIApplication.topViewController()!.view.addSubview(floaty)

       // if let navVC = UIApplication.topViewController()!.navigationController {
         //   navVC.view.addSubview(Floaty.global.button)
       // } else {
            Floaty.global.show()
       // }
    }
    
    func uploadAction() {
        
        /** take final screenshots */
        if let view = UIApplication.topViewController()?.view {
            let screenshot = takeScreenshot(view: view)
            self.manualScreenshots[Int(Date().timeIntervalSince1970)] = screenshot
        }
        
        completeSessionWithUpload()
        
        let alertController = UIAlertController(title: "Upload Session", message: "Synchronizing the session with AnushkTestSDK server", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    
    func screenshotAction() {
        
        //capture screenshot
        if let view = UIApplication.topViewController()?.view {
            let screenshot = takeScreenshot(view: view)
            self.manualScreenshots[Int(Date().timeIntervalSince1970)] = screenshot
            if (self.saveScreenshotsLocally) {
                UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
                
                let alertController = UIAlertController(title: "Capture Screenshot", message: "Successfully captured the screenshot and also saved it to your device", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OKAction)
                UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
                //DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                   // alertController.dismiss(animated: false, completion: nil)
               //}
            } else {
                 print("save was not allowed")
            }
        }
        
        
    }
    
    
    func commentAction() {
        var lastLogger = lastLoggers.last!
        // iterate the list of loggers from back
        for logger in lastLoggers.reversed() {
            // get the last non float button
            if (!logger.isFloatButton) {
                // use it & exit
                lastLogger = logger
                break
            }
        }
        
        // comment
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add Comment", message: "Enter your comments...", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "Lorem Ipsum"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //      print("Text field: \((textField?.text)!)")
            lastLogger.comments = (textField?.text)!
        }))
        
        // 4. Present the alert.
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    
    func addAction() {
        
        // add assertion check was called
        print("add assertion called1")
        
        
        
        // currently not in assert mode
        if (!self.isAssertValid) {
            // change to assert mode
            self.isAssertValid = true
            dont_log_mode = true
            print("set grid")
        //    if (self.grid?.isHidden)! {
                DispatchQueue.main.async {
                    self.grid?.toggleHidden()
                }
         //   }
            return // do nothing
        } else {
            print("removing grid")
            // already in assert mode
            self.isAssertValid = false
            self.dont_log_mode = false
            //if (!(self.grid?.isHidden)!) {
                DispatchQueue.main.async {
                    self.grid?.toggleHidden()
                }
            //}
        }
        
        //self.callAddAssertionCheck()
    }
    
}

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    if (AnushkTestSDKManager.shared.DEBUGGING) {
        Swift.print(items[0], separator:separator, terminator: terminator)
    }
}


struct AssertionCheck {
    var timeStamp: String
    var check: [String: String]
}
