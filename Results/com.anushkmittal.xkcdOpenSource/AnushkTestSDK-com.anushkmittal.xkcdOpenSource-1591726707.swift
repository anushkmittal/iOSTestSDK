
    //
    //  AnushkTestSDK-1591726707.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.anushkmittal.xkcdOpenSource.
    // 

    import XCTest

    class AnushkTestSDK1591726707: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.anushkmittal.xkcdOpenSource")
            app.launch()        
            
            let el0 = app.staticTexts["xkcd: Open Source"]
            var not_frame0: CGRect? = nil
            if app.buttons.staticTexts["xkcd: Open Source"].exists {
                not_frame0 = app.buttons.staticTexts["xkcd: Open Source"].frame
            }
            let el0s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'xkcd: Open Source'"))
            var correct_el0: [XCUIElement] = []
            for i in 0..<el0s.count {
                let el = el0s.element(boundBy: i)
                if (not_frame0 == nil) || (el.frame != not_frame0) {
                    correct_el0.append(el)
                }
            }
            XCTAssert(correct_el0.count == 1)
            XCTAssert(correct_el0[0].exists)
            XCTAssert(correct_el0[0].label == "xkcd: Open Source")

            app.terminate()

        }

    }

    