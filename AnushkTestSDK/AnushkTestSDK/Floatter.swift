//
//  Float.swift
//  Pods
//
//  Created by Anushk Mittal on 4/7/17.
//
//

/*import Foundation
import UIKit

open class Floatter: FloatingMenuControllerDelegate {
    
    public init() {
        
    }
    
    open func ButtonShower() {
        let window :UIWindow = UIApplication.shared.keyWindow!
        
        var floatingButton: FloatingButton!
        floatingButton = FloatingButton()
        
        // UIButton(type: UIButtonType.custom) as! FloatingButton
        floatingButton.setup()
        floatingButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let image = UIImage(named: "add") as UIImage?
        floatingButton.setImage(image, for: .normal)
        floatingButton.addTarget(self, action: #selector(Floatter.inside(sender:event:)), for: .touchDragInside)
        floatingButton.addTarget(self, action: #selector(Floatter.outside(sender:event:)), for: .touchDragOutside)
       // floatingButton.addTarget(self, action: #selector(Floatter.floatingButtonPressed),for:.touchUpInside)
        window.addSubview(floatingButton)
    }
    
    open func getVisibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        
        var rootVC = rootViewController
        if rootVC == nil {
            rootVC = UIApplication.shared.keyWindow?.rootViewController
        }
        
        if rootVC?.presentedViewController == nil {
            return rootVC
        }
        
        if let presented = rootVC?.presentedViewController {
            if presented.isKind(of: UINavigationController.self) {
                let navigationController = presented as! UINavigationController
                return navigationController.viewControllers.last!
            }
            
            if presented.isKind(of: UITabBarController.self) {
                let tabBarController = presented as! UITabBarController
                return tabBarController.selectedViewController!
            }
            
            return getVisibleViewController(presented)
        }
        return nil
    }
    
     open func floatingButtonPressed(_ sender: AnyObject) {
        print("called")

        let controller = FloatingMenuController(fromView: sender as! UIButton)
        controller.delegate = self as? FloatingMenuControllerDelegate
        
        controller.buttonArray = [
            FloatingButton(image: UIImage(named: "icon-add"), backgroundColor: UIColor.flatBlueColor),
            FloatingButton(image: UIImage(named: "model-008"), backgroundColor: nil),
            FloatingButton(image: UIImage(named: "model-007"), backgroundColor: nil)
        ]
        
        controller.labelTitles = [
            "New Contact",
            "Heidi Hernandez",
            "Neil Ross",
        ]
        
        //presentViewController(controller, animated: true, completion: nil)
        
        self.getVisibleViewController(nil)?.present(controller, animated: true, completion: nil)
    }
    
    @objc public class func inside(sender: AnyObject, event: UIEvent) {
        print("called")

        guard let control = sender as? UIControl else { return }
        guard let touches = event.allTouches else { return }
        guard let touch = touches.first else { return }
        
        let prev = touch.previousLocation(in: control)
        let p = touch.location(in: control)
        var center = control.center
        center.x += p.x - prev.x
        center.y += p.y - prev.y
        control.center = center
        
    }
    
    @objc public class func outside(sender: AnyObject, event: UIEvent) {
        print("called")
        guard let control = sender as? UIControl else { return }
        guard let touches = event.allTouches else { return }
        guard let touch = touches.first else { return }
        
        let prev = touch.previousLocation(in: control)
        let p = touch.location(in: control)
        var center = control.center
        center.x += p.x - prev.x
        center.y += p.y - prev.y
        control.center = center
        
    }
    
    open func floatingMenuController(_ controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int) {
        print(index)
        print("touched work for :" + String(index))
    }
    
    open func floatingMenuControllerDidCancel(_ controller: FloatingMenuController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public class func imageMoved(sender: AnyObject, event: UIEvent) {
        guard let control = sender as? UIControl else { return }
        guard let touches = event.allTouches else { return }
        guard let touch = touches.first else { return }
        
        let prev = touch.previousLocation(in: control)
        let p = touch.location(in: control)
        var center = control.center
        center.x += p.x - prev.x
        center.y += p.y - prev.y
        control.center = center
    }
    
    
}*/
