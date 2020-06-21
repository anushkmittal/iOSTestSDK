
    //
    //  AnushkTestSDK-1591804755.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-10 for LongGames.Alarm.ios.swift.
    // 

    import XCTest

    class AnushkTestSDK1591804755: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "LongGames.Alarm.ios.swift")
            app.launch()        
            
            let el0 = app.buttons["Edit"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["Done"]
            XCTAssertTrue(el1.exists)
            el1.tap()

            app.terminate()

        }

    }

    