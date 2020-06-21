
    //
    //  AnushkTestSDK-1591804500.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-10 for LongGames.Alarm.ios.swift.
    // 

    import XCTest

    class AnushkTestSDK1591804500: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "LongGames.Alarm.ios.swift")
            app.launch()        
            
            let el0 = app.buttons["Add"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["Cancel"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.buttons["Add"]
            XCTAssertTrue(el2.exists)
            el2.tap()
            let el3 = app.buttons["Save"]
            XCTAssertTrue(el3.exists)
            el3.tap()

            app.terminate()

        }

    }

    