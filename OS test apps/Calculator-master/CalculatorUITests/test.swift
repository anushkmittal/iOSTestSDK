//
//  AnushkTestSDK-1590824869.swift
//
//  Automatically created by AnushkTestSDK
//
// Created on 2020-05-30 for com.byteorbit.malcolm.Calculator.
//

import XCTest

class AnushkTestSDK: XCTestCase {

    func testSession() throws {
        let app = XCUIApplication()
        app.launch()
        
        let el0 = app.buttons.staticTexts["2"]
        XCTAssertTrue(el0.exists)
        el0.tap()
        XCTAssert(el0.isSelected == false)
        //XCTAssert(el0. == false)
       // XCTAssert(el0. == false)
        
        let el1 = app.buttons.staticTexts["+"]
        XCTAssertTrue(el1.exists)
        el1.tap()
        let el2 = app.buttons.staticTexts["9"]
        XCTAssertTrue(el2.exists)
        el2.tap()
        let el3 = app.buttons.staticTexts["="]
        XCTAssertTrue(el3.exists)
        el3.tap()
        let el4 = app.staticTexts["11"]
        var not_frame4: CGRect? = nil
        if app.buttons.staticTexts["11"].exists {
            not_frame4 = app.buttons.staticTexts["11"].frame
        }
        let el4s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] '11'"))
        var correct_el4: [XCUIElement] = []
        for i in 0..<el4s.count {
            let el = el4s.element(boundBy: i)
            if (not_frame4 == nil) || (el.frame != not_frame4) {
                correct_el4.append(el)
            }
        }
        XCTAssert(correct_el4.count == 1)
        XCTAssert(correct_el4[0].exists)
        XCTAssert(correct_el4[0].label == "11")
        app.terminate()

    }

}


