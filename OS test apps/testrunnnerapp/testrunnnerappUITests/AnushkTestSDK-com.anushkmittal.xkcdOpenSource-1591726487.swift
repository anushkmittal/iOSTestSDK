//
//  AnushkTestSDK-1591726487.swift
//
//  Automatically created by AnushkTestSDK
//
// Created on 2020-06-09 for com.anushkmittal.xkcdOpenSource.
//

import XCTest

class AnushkTestSDK1591726487: XCTestCase {
    
    func testSession() throws {
        let app = XCUIApplication(bundleIdentifier: "com.anushkmittal.xkcdOpenSource")
        app.launch()
        
        let el0 = app.buttons["2317"]
        XCTAssertTrue(el0.exists)
        el0.tap()
        
        app.terminate()
        
    }
    
}


