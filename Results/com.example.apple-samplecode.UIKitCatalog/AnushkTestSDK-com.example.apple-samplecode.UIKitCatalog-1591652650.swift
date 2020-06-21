
    //
    //  AnushkTestSDK-1591652650.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-08 for com.example.apple-samplecode.UIKitCatalog.
    // 

    import XCTest

    class AnushkTestSDK1591652650: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Steppers'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.staticTexts["7"]
            var not_frame1: CGRect? = nil
            if app.buttons.staticTexts["7"].exists {
                not_frame1 = app.buttons.staticTexts["7"].frame
            }
            let el1s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] '7'"))
            var correct_el1: [XCUIElement] = []
            for i in 0..<el1s.count {
                let el = el1s.element(boundBy: i)
                if (not_frame1 == nil) || (el.frame != not_frame1) {
                    correct_el1.append(el)
                }
            }
            XCTAssert(correct_el1.count == 1)
            XCTAssert(correct_el1[0].exists)
            XCTAssert(correct_el1[0].label == "7")

            app.terminate()

        }

    }

    