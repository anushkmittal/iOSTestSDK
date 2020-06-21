
    //
    //  AnushkTestSDK-1591740625.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.memeois.yourcancelled.
    // 

    import XCTest

    class AnushkTestSDK1591740625: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.memeois.yourcancelled")
            app.launch()        
            
            let el0 = app.staticTexts["plans to cancel"]
            var not_frame0: CGRect? = nil
            if app.buttons.staticTexts["plans to cancel"].exists {
                not_frame0 = app.buttons.staticTexts["plans to cancel"].frame
            }
            let el0s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'plans to cancel'"))
            var correct_el0: [XCUIElement] = []
            for i in 0..<el0s.count {
                let el = el0s.element(boundBy: i)
                if (not_frame0 == nil) || (el.frame != not_frame0) {
                    correct_el0.append(el)
                }
            }
            XCTAssert(correct_el0.count == 1)
            XCTAssert(correct_el0[0].exists)
            let el1 = app.buttons["add"]
            XCTAssert(el1.exists)
            XCTAssert(el1.label == "add")
            let el2 = app.buttons["sign out"]
            XCTAssert(el2.exists)
            XCTAssert(el2.label == "sign out")

            app.terminate()

        }

    }

    