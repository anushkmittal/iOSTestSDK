//
//  Utility Functions.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 1/19/18.
//  Copyright © 2018 Anushk Mittal. All rights reserved.
//

import UIKit
import Foundation

// MARK:- Extensions
extension UIControl {
    
    /// Returns an array of actions the button will invoke
    public func getActions() -> [String] {
        var results: [String] = []
        if let win = window {
            let top = win.rootViewController
            let vc = UIViewController.visibleController(vc: top!)
            if let events = actions(forTarget: vc, forControlEvent: allControlEvents) {
                for action in events {
                    results.append(action)
                }
            }
        } else {
            print("window is nil")
        }
        
        return results
    }
    
}

// MARK:- Universal functions

/// Takes a screenshot of the view
func takeScreenshot(view: UIView) -> UIImage {
    let layer = UIApplication.shared.keyWindow!.layer
    let scale = UIScreen.main.scale * 0.4
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
    
    layer.render(in: UIGraphicsGetCurrentContext()!)
    let screenshot = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return screenshot!
}


/// Checks if two images are the same based on their NSData
public func image(image1: UIImage, isEqualTo image2: UIImage) -> Bool {
    let data1 = image1.pngData()
    let data2 = image2.pngData()
    return data1 == data2
}

/// gets the root VC
var root: UIViewController? {
    get {
        return UIApplication.shared.delegate?.window??.rootViewController
    }
}

/// gets the top VC also accounting for `UITabBarController`, `UINavigationController` and `presentedViewController
func topViewController(from viewController: UIViewController) -> UIViewController? {
    if let tabBarViewController = viewController as? UITabBarController {
        return topViewController(from: tabBarViewController.selectedViewController!)
    } else if let navigationController = viewController as? UINavigationController {
        return topViewController(from: navigationController.visibleViewController!)
    } else if let presentedViewController = viewController.presentedViewController {
        return topViewController(from: presentedViewController)
    } else {
        return viewController
    }
}
