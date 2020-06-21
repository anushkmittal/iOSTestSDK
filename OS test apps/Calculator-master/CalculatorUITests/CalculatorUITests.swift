//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Anushk Mittal on 5/28/20.
//  Copyright © 2020 Byte Orbit. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1() throws {
        let app = XCUIApplication()
        app.launch()
        
        let b0 = app.buttons.staticTexts["9"]
        XCTAssertTrue(b0.exists)
        b0.tap()
        
        let b1 = app.buttons.staticTexts["+"]
        XCTAssertTrue(b1.exists)
        b1.tap()
        
        let b2 = app.buttons.staticTexts["4"]
        b2.label
        XCTAssertTrue(b2.exists)
        b2.tap()
        
        let b3 = app.buttons.staticTexts["="]
        XCTAssertTrue(b3.exists)
        b3.tap()
        
        app.staticTexts[""]
        let t1 = app.staticTexts.matching(NSPredicate(format: "label BEGINSWITH[cd] '13'"))
        XCTAssert(t1.count == 1) // check for 1 hit
        XCTAssertTrue(t1.firstMatch.exists) // check for 1 hit
        
        
        /*let app = XCUIApplication()
        app.buttons["/"].tap()
        
        let cButton = app.buttons["C"]
        cButton.tap()
        cButton.tap()
        cButton.tap()
        app.tables["Empty list"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["AC"]/*[[".buttons[\"AC\"].staticTexts[\"AC\"]",".staticTexts[\"AC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        
        app.terminate()*/
        
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
       // resetState()
        let app = XCUIApplication()
        app.launch()
        app.buttons.staticTexts["1"].tap()
        app.buttons.staticTexts["+"].tap()
        app.buttons.staticTexts["1"].tap()
        app.buttons.staticTexts["="].tap()
        
        let staticText = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).staticTexts["2"]
        
       // let predicate = NSPredicate(format: "label BEGINSWITH[cd] 'Reorder 1'")
       // let button = app.elementMatchingPredicate(predicate)
        
        
        assert(staticText.exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
