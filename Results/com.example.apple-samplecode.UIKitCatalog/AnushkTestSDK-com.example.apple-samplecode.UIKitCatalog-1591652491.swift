
    //
    //  AnushkTestSDK-1591652491.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-08 for com.example.apple-samplecode.UIKitCatalog.
    // 

    import XCTest

    class AnushkTestSDK1591652491: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Alert Controller'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Confirm / Cancel'"))
            assert(el1s.count == 1)
            let el1 = el1s.element(boundBy: 0)
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.buttons["Confirm"]
            XCTAssertTrue(el2.exists)
            el2.tap()
            let el3s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Destructive'"))
            assert(el3s.count == 1)
            let el3 = el3s.element(boundBy: 0)
            XCTAssertTrue(el3.exists)
            el3.tap()
            let el4 = app.buttons["Destructive Choice"]
            XCTAssertTrue(el4.exists)
            el4.tap()
            let el5s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Confirm / Cancel'"))
            assert(el5s.count == 1)
            let el5 = el5s.element(boundBy: 0)
            XCTAssertTrue(el5.exists)
            el5.tap()
            let el6 = app.buttons["Cancel"]
            XCTAssertTrue(el6.exists)
            el6.tap()
            let el7s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Destructive'"))
            assert(el7s.count == 1)
            let el7 = el7s.element(boundBy: 0)
            XCTAssertTrue(el7.exists)
            el7.tap()
            let el8 = app.buttons["Safe Choice"]
            XCTAssertTrue(el8.exists)
            el8.tap()

            app.terminate()

        }

    }

    