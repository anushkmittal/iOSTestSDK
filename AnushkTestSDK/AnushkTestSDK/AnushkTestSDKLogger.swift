//
//  AnushkTestSDKLogger.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 1/9/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//


import Foundation
import UIKit

@objc public class AnushkTestSDKLogger: NSObject {
    
    @objc public var timesincestartup_on_end: Int = -1
    
    @objc public var isFloatButton: Bool = false
    @objc public var isAnAssertionLog: Bool = false
        
    @objc public var isUIControl: String = ""
    @objc public var stateUIControl: String = ""
    @objc public var isEnabled: String = ""
    @objc public var isSelected: String = ""
    @objc public var isHighlighted: String = ""
    @objc public var bounds: String = ""
    @objc public var constrains: String = ""
    @objc public var tags: String = ""
    @objc public var accessibilityLabell: String = ""
    @objc public var accessibilityFramee: String = ""
    
    @objc public var allClicksLogged: String = ""
    @objc public var eventType: String = ""
    
    @objc public var viewDetails: String = ""
    @objc public var superView: String = ""
    @objc public var superViewBound: String = ""
    @objc public var superViewConstrain: String = ""
    @objc public var superViewTag: String = ""
    @objc public var receiverSubview: String = ""
    @objc public var receiverWindow: String = ""
    @objc public var maskView: String = ""
    @objc public var uiTouchPhase: String = ""
    @objc public var tapCount: String = ""
    @objc public var maxPossForce: String = ""
    @objc public var timeStamp: String = ""
    @objc public var typeOfTouch: String = ""
    @objc public var gestureRecognizers: String = ""
    @objc public var comments: String = ""
    
    @objc public var tree: String = ""
    @objc public var action: String = ""
    @objc public var senderOld: AnyObject? = nil
    @objc public var event: UIEvent? = nil
    @objc public var screenshot: UIImage? = nil
    @objc public var assert_items: [String: String] = [:]
    
    @objc public func callUploadRequest() {
                
        // extra validation
        if (senderOld == nil || event == nil) {
            return
        }
        
        let sender = senderOld!
        
        var myTree = ""
        if (sender is UIView) {
            myTree = ((sender).getTree(withProperties: false))
        }
        
        if myTree == tree {
            return
        }
        
        tree = myTree
                
        if (AnushkTestSDKManager.shared.enableScreenshot) {
            if let view = sender.superview {
                screenshot = takeScreenshot(view: view!)
            }
            
        }
    }
    
}
