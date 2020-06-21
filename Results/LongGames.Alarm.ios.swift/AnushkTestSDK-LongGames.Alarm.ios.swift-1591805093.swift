
    //
    //  AnushkTestSDK-1591805093.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-10 for LongGames.Alarm.ios.swift.
    // 

    import XCTest

    class AnushkTestSDK1591805093: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "LongGames.Alarm.ios.swift")
            app.launch()        
            
            let el0 = app.buttons["Add"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.staticTexts["Add Alarm"]
            var not_frame1: CGRect? = nil
            if app.buttons.staticTexts["Add Alarm"].exists {
                not_frame1 = app.buttons.staticTexts["Add Alarm"].frame
            }
            let el1s = app.staticTexts.containing(NSPredicate(format: "label LIKE[c] 'Add Alarm'"))
            var correct_el1: [XCUIElement] = []
            for i in 0..<el1s.count {
                let el = el1s.element(boundBy: i)
                if (not_frame1 == nil) || (el.frame != not_frame1) {
                    correct_el1.append(el)
                }
            }
            XCTAssert(correct_el1.count == 1)
            XCTAssert(correct_el1[0].exists)
            let el2s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Repeat'"))
            assert(el2s.count == 1)
            let el2 = el2s.element(boundBy: 0)
            let el3s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Label'"))
            assert(el3s.count == 1)
            let el3 = el3s.element(boundBy: 0)
            let el4s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Sound'"))
            assert(el4s.count == 1)
            let el4 = el4s.element(boundBy: 0)
            let el5s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Snooze'"))
            assert(el5s.count == 1)
            let el5 = el5s.element(boundBy: 0)
            let el6s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Never'"))
            assert(el6s.count == 1)
            let el6 = el6s.element(boundBy: 0)
            let el7s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Alarm Label'"))
            assert(el7s.count == 1)
            let el7 = el7s.element(boundBy: 0)
            let el8s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'bell'"))
            assert(el8s.count == 1)
            let el8 = el8s.element(boundBy: 0)

            app.terminate()

        }

    }

    
