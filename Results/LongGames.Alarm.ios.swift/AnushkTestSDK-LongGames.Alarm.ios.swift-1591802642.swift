//
//  AnushkTestSDK-1591802642.swift
//
//  Automatically created by AnushkTestSDK
//
// Created on 2020-06-10 for LongGames.Alarm.ios.swift.
//

import XCTest

class AnushkTestSDK1591802642: XCTestCase {
    
    func testSession() throws {
        let app = XCUIApplication(bundleIdentifier: "LongGames.Alarm.ios.swift")
        app.launch()
        
        let el0 = app.buttons["Add"]
        XCTAssert(el0.exists)
        let el1 = app.staticTexts["iOS Alarm"]
        var not_frame1: CGRect? = nil
        if app.buttons.staticTexts["iOS Alarm"].exists {
            not_frame1 = app.buttons.staticTexts["iOS Alarm"].frame
        }
        let el1s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'iOS Alarm'"))
        var correct_el1: [XCUIElement] = []
        for i in 0..<el1s.count {
            let el = el1s.element(boundBy: i)
            if (not_frame1 == nil) || (el.frame != not_frame1) {
                correct_el1.append(el)
            }
        }
        XCTAssert(correct_el1.count == 1)
        XCTAssert(correct_el1[0].exists)
        let el2 = app.buttons["Edit"]
        XCTAssert(el2.exists)
        
        app.terminate()
        
    }
    
}
