
    //
    //  AnushkTestSDK-1590835606.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-05-30 for com.byteorbit.malcolm.Calculator.
    // 

    import XCTest

    class AnushkTestSDK1590835606: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0 = app.buttons["+"]
            XCTAssert(el0.isEnabled == true)
            XCTAssert(el0.isSelected == false)
            let el1 = app.buttons["1"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.buttons["+"]
            XCTAssert(el2.isEnabled == true)
            XCTAssert(el2.isSelected == false)
            let el3 = app.buttons["+"]
            XCTAssertTrue(el3.exists)
            el3.tap()
            let el4 = app.buttons["+"]
            XCTAssert(el4.isEnabled == true)
            XCTAssert(el4.isSelected == false)
            let el5 = app.buttons["1"]
            XCTAssertTrue(el5.exists)
            el5.tap()
            let el6 = app.buttons["+"]
            XCTAssert(el6.isEnabled == true)
            XCTAssert(el6.isSelected == false)
            let el7 = app.buttons["="]
            XCTAssertTrue(el7.exists)
            el7.tap()
            let el8 = app.buttons["+"]
            XCTAssert(el8.isEnabled == true)
            XCTAssert(el8.isSelected == false)
            let el9 = app.staticTexts["2"]
            var not_frame9: CGRect? = nil
            if app.buttons.staticTexts["2"].exists {
                not_frame9 = app.buttons.staticTexts["2"].frame
            }
            let el9s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] '2'"))
            var correct_el9: [XCUIElement] = []
            for i in 0..<el9s.count {
                let el = el9s.element(boundBy: i)
                if (not_frame9 == nil) || (el.frame != not_frame9) {
                    correct_el9.append(el)
                }
            }
            XCTAssert(correct_el9.count == 1)
            XCTAssert(correct_el9[0].exists)
            XCTAssert(correct_el9[0].label == "2")

            app.terminate()

        }

    }

    
