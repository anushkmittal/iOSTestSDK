
    //
    //  AnushkTestSDK-1591739407.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.memeois.yourcancelled.
    // 

    import XCTest

    class AnushkTestSDK1591739407: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.memeois.yourcancelled")
            app.launch()        
            
            let el0 = app.buttons["add"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.staticTexts["new plan"]
            var not_frame1: CGRect? = nil
            if app.buttons.staticTexts["new plan"].exists {
                not_frame1 = app.buttons.staticTexts["new plan"].frame
            }
            let el1s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'new plan'"))
            var correct_el1: [XCUIElement] = []
            for i in 0..<el1s.count {
                let el = el1s.element(boundBy: i)
                if (not_frame1 == nil) || (el.frame != not_frame1) {
                    correct_el1.append(el)
                }
            }
            XCTAssert(correct_el1.count == 1)
            XCTAssert(correct_el1[0].exists)

            app.terminate()

        }

    }

    