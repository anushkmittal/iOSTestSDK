//
//  UIView+AnushkTestSDK.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 9/30/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import Foundation

public extension UIView {
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
        //return NSStringFromClass(self.classForCoder).componentsSeparatedByString(".").last!
    }
    
    // Returns an array of property names of the object
    func propertyNames() -> Array<String> {
        let blacklist = ["_layoutEngine","_constraintsExceptingSubviewAutoresizingConstraints","_backdropMaskViews","inputSettings","items","outputSettings","visibleCells","indexPathsForVisibleRows","observers"]
        
        var results: Array<String> = [];
        
        var count: UInt32 = 0;
        let aClass: AnyClass = self.classForCoder;
        let properties = class_copyPropertyList(aClass, &count);
        
        for i: UInt32 in 0 ..< count {
            let property = properties?[Int(i)];
            let name = String(cString:property_getName(property!));
            // Attributed properties cause issues with JSON formatting
            
            if name.lowercased().range(of: "ttributed") == nil && !blacklist.contains(name) && !results.contains(name) {
                results.append(name);
            }
            
        }
        
        free(properties);
        return results;
    }
    
    // Handles exceptions being thrown from valueForKey in propertyValues()
    func valueForUndefinedKey(key: String) -> AnyObject? {
        return nil
    }
    
    // This will include the rootViewController and that controller's view in the hierarchy
    @objc func getTree(withProperties properties: Bool) -> String {
        if (self.window == nil) {
            return ""
        }
        let root = self.window!.rootViewController
        
        if (root == nil) {
            return ""
        }
        return "{\"class\":\"\(root!.className)\", \"children\":[\(getInnerTree(fromView: root!.view, withProperties: properties))]}"
    }
    
    // Returns the UI Tree as a single JSON string
    func getInnerTree(fromView view: UIView, withProperties properties: Bool) -> String {
        var result: String = "{"
        
        let classname = view.className
        if view == self {
            result = result + ("\"active\":\"true\",")
        }
        result = result + "\"class\": \"\(classname)\""
        
        var childNodes: String = ""
        for item in view.subviews {
            let tree = getInnerTree(fromView: item, withProperties: properties)
            childNodes = childNodes.count > 1 ? childNodes + ",\(tree)" : "\(tree)"
        }
        
        if(childNodes.count > 0) {
            result = result + ",\"children\": ["+childNodes+"]"
        }
        
        if properties {
            result = result + ",\"properties\":{\(view.getJSONValues())}"
        }
        
        return result + "}"
    }
    
    // Returns a single string with JSON formatting
    func getJSONValues() -> String {
        var result: String = ""
        for item in propertyNames() {
            var key = item
            if item[item.startIndex] == "_" {
                key = String(item.dropFirst())
            }
            if let value = value(forKey: key) {
                var str = "\(value)"
                str = str.replacingOccurrences(of: "\"", with: "\\\"")
                if !(value is NSNumber) {
                    str = "\"\(str)\""
                }
                result = result + "\"\(item)\":\(str),"
            }
        }
        result = String(result.dropLast())
        return result
    }
}
