
    //
    //  AnushkTestSDK-1591741458.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.memeois.yourcancelled.
    // 

    import XCTest

    class AnushkTestSDK1591741458: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.memeois.yourcancelled")
            app.launch()
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'test_plan (test_user)'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["cancel"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.staticTexts["test_plan (test_user)"]
            var not_frame2: CGRect? = nil
            if app.buttons.staticTexts["test_plan (test_user)"].exists {
                not_frame2 = app.buttons.staticTexts["test_plan (test_user)"].frame
            }
            let el2s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'test_plan (test_user)'"))
            var correct_el2: [XCUIElement] = []
            for i in 0..<el2s.count {
                let el = el2s.element(boundBy: i)
                if (not_frame2 == nil) || (el.frame != not_frame2) {
                    correct_el2.append(el)
                }
            }
            XCTAssert(correct_el2.count == 1)
            XCTAssert(correct_el2[0].exists)
            let el3 = app.staticTexts["waiting for friend"]
            var not_frame3: CGRect? = nil
            if app.buttons.staticTexts["waiting for friend"].exists {
                not_frame3 = app.buttons.staticTexts["waiting for friend"].frame
            }
            let el3s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'waiting for friend'"))
            var correct_el3: [XCUIElement] = []
            for i in 0..<el3s.count {
                let el = el3s.element(boundBy: i)
                if (not_frame3 == nil) || (el.frame != not_frame3) {
                    correct_el3.append(el)
                }
            }
            XCTAssert(correct_el3.count == 1)
            XCTAssert(correct_el3[0].exists)
            let el4 = app.navigationBars.buttons.element(boundBy: 0)
            XCTAssertTrue(el4.exists)
            el4.tap()
            let el5 = app.staticTexts["plans to cancel"]
            var not_frame5: CGRect? = nil
            if app.buttons.staticTexts["plans to cancel"].exists {
                not_frame5 = app.buttons.staticTexts["plans to cancel"].frame
            }
            let el5s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'plans to cancel'"))
            var correct_el5: [XCUIElement] = []
            for i in 0..<el5s.count {
                let el = el5s.element(boundBy: i)
                if (not_frame5 == nil) || (el.frame != not_frame5) {
                    correct_el5.append(el)
                }
            }
            XCTAssert(correct_el5.count == 1)
            XCTAssert(correct_el5[0].exists)

            app.terminate()

        }

    }

    
