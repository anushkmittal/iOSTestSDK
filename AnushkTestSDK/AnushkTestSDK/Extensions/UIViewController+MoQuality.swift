//
//  Universal.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 9/30/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @objc var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    // Return the current visible ViewController of the root
    public class func visibleController(vc: UIViewController) -> UIViewController{
        if vc is UINavigationController {
            let nav = vc as! UINavigationController
            return nav.visibleViewController!
        } else if vc is UITabBarController {
            let tab = vc as! UITabBarController
            return tab.selectedViewController!
        }
        return vc
    }
    
}
