
    //
    //  AnushkTestSDK-1591740451.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.memeois.yourcancelled.
    // 

    import XCTest

    class AnushkTestSDK1591740451: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.memeois.yourcancelled")
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'test_plan (test_user)'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            let el1 = app.buttons["add"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el2.exists)
            el2.tap()
            let el3s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'test_plan (test_user)'"))
            assert(el3s.count == 1)
            let el3 = el3s.element(boundBy: 0)

            app.terminate()

        }

    }

    