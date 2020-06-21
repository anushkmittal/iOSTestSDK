
    //
    //  AnushkTestSDK-1591739577.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.memeois.yourcancelled.
    // 

    import XCTest

    class AnushkTestSDK1591739577: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.memeois.yourcancelled")
            app.launch()        
            
            let el0 = app.buttons["add"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["SAVE"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.staticTexts["cant leave the plan name..."]
            var not_frame2: CGRect? = nil
            if app.buttons.staticTexts["cant leave the plan name..."].exists {
                not_frame2 = app.buttons.staticTexts["cant leave the plan name..."].frame
            }
            let el2s = app.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] 'cant leave the plan name'"))
            var correct_el2: [XCUIElement] = []
            for i in 0..<el2s.count {
                let el = el2s.element(boundBy: i)
                if (not_frame2 == nil) || (el.frame != not_frame2) {
                    correct_el2.append(el)
                }
            }
            XCTAssert(correct_el2.count == 1)
            XCTAssert(correct_el2[0].exists)

            app.terminate()

        }

    }

    
