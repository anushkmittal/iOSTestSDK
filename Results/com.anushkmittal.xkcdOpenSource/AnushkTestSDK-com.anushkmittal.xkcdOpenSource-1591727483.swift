
    //
    //  AnushkTestSDK-1591727483.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.anushkmittal.xkcdOpenSource.
    // 

    import XCTest

    class AnushkTestSDK1591727483: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.anushkmittal.xkcdOpenSource")
            app.launch()        
            
            let el0 = app.buttons["2317"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.staticTexts["#2317 Jun 8, 2020"]
            let el2 = app.buttons["Explain"]
            XCTAssert(el2.exists)
            XCTAssert(el2.label == "Explain")
            let el3 = app.staticTexts["The other side of USB-C i..."]
            var not_frame3: CGRect? = nil
            if app.buttons.staticTexts["The other side of USB-C i..."].exists {
                not_frame3 = app.buttons.staticTexts["The other side of USB-C i..."].frame
            }
            let el3s = app.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] 'The other side of USB-C i'"))
            var correct_el3: [XCUIElement] = []
            for i in 0..<el3s.count {
                let el = el3s.element(boundBy: i)
                if (not_frame3 == nil) || (el.frame != not_frame3) {
                    correct_el3.append(el)
                }
            }
            XCTAssert(correct_el3.count == 1)
            XCTAssert(correct_el3[0].exists)

            app.terminate()

        }

    }

    