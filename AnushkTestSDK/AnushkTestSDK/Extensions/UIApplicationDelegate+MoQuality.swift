//
//  UIApplicationDelegate+AnushkTestSDK.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 9/30/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController
        {
            let top = topViewController(nav.visibleViewController)
            return top
        }
        
        if let tab = base as? UITabBarController
        {
            if let selected = tab.selectedViewController
            {
                let top = topViewController(selected)
                return top
            }
        }
        
        if let presented = base?.presentedViewController
        {
            let top = topViewController(presented)
            return top
        }
        return base
    }
}
