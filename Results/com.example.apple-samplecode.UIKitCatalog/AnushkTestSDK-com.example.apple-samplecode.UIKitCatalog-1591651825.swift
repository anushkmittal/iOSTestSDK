
    //
    //  AnushkTestSDK-1591651825.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-08 for com.example.apple-samplecode.UIKitCatalog.
    // 

    import XCTest

    class AnushkTestSDK1591651825: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Activity Indicators'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'AlertControllerViewController'"))
            assert(el2s.count == 1)
            let el2 = el2s.element(boundBy: 0)
            XCTAssertTrue(el2.exists)
            el2.tap()
            let el3 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el3.exists)
            el3.tap()
            let el4s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Page Control'"))
            assert(el4s.count == 1)
            let el4 = el4s.element(boundBy: 0)
            XCTAssertTrue(el4.exists)
            el4.tap()
            let el5 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el5.exists)
            el5.tap()
            let el6s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Steppers'"))
            assert(el6s.count == 1)
            let el6 = el6s.element(boundBy: 0)
            XCTAssertTrue(el6.exists)
            el6.tap()
            let el7 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el7.exists)
            el7.tap()
            let el8s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Segmented Controls'"))
            assert(el8s.count == 1)
            let el8 = el8s.element(boundBy: 0)
            XCTAssertTrue(el8.exists)
            el8.tap()
            let el9 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el9.exists)
            el9.tap()
            let el10s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Buttons'"))
            assert(el10s.count == 1)
            let el10 = el10s.element(boundBy: 0)
            XCTAssertTrue(el10.exists)
            el10.tap()
            let el11 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el11.exists)
            el11.tap()
            let el12s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Progress Views'"))
            assert(el12s.count == 1)
            let el12 = el12s.element(boundBy: 0)
            XCTAssertTrue(el12.exists)
            el12.tap()
            let el13 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el13.exists)
            el13.tap()

            app.terminate()

        }

    }

    
