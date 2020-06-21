//
//  AnushkTestSDK-1590749159.swift
//
//  Automatically created by AnushkTestSDK
//
// Created on 2020-05-30 for com.byteorbit.malcolm.Calculator.
//

import XCTest

class AnushkTestSDK1590749159: XCTestCase {

    func testSession() throws {
        let app = XCUIApplication()
        app.launch()
        
        let el0 = app.buttons.staticTexts["9"]
        XCTAssertTrue(el0.exists)
        el0.tap()
        let el1 = app.staticTexts["9"]
        var not_frame1: CGRect? = nil
        if app.buttons.staticTexts["9"].exists {
            not_frame1 = app.buttons.staticTexts["9"].frame
        }
        let el1s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] '9'"))
        var correct_el1: [XCUIElement] = []
        for i in 0..<el1s.count {
            let el = el1s.element(boundBy: i)
            if (not_frame1 == nil) || (el.frame != not_frame1) {
                correct_el1.append(el)
            }
        }
        XCTAssert(correct_el1.count == 1)
        XCTAssert(correct_el1[0].exists)
        XCTAssert(correct_el1[0].label == "9")
        let el2 = app.buttons.staticTexts["AC"]
        XCTAssertTrue(el2.exists)
        el2.tap()
        let el3 = app.staticTexts["0"]
        var not_frame3: CGRect? = nil
        if app.buttons.staticTexts["0"].exists {
            not_frame3 = app.buttons.staticTexts["0"].frame
        }
        let el3s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] '0'"))
        var correct_el3: [XCUIElement] = []
        for i in 0..<el3s.count {
            let el = el3s.element(boundBy: i)
            if (not_frame3 == nil) || (el.frame != not_frame3) {
                correct_el3.append(el)
            }
        }
        XCTAssert(correct_el3.count == 1)
        XCTAssert(correct_el3[0].exists)
        XCTAssert(correct_el3[0].label == "0")

        app.terminate()

    }

}
