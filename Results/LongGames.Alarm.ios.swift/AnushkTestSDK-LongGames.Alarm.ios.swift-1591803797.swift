
    //
    //  AnushkTestSDK-1591803797.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-10 for LongGames.Alarm.ios.swift.
    // 

    import XCTest

    class AnushkTestSDK1591803797: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "LongGames.Alarm.ios.swift")
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] '4:50 AM'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            let el1s = app.cells.containing(NSPredicate(format: "label LIKE[c] '4:55 PM'"))
            assert(el1s.count == 1)
            let el1 = el1s.element(boundBy: 0)
            let el2s = app.cells.containing(NSPredicate(format: "label LIKE[c] '5:51 AM'"))
            assert(el2s.count == 1)
            let el2 = el2s.element(boundBy: 0)
            let el3s = app.cells.containing(NSPredicate(format: "label LIKE[c] '4:59 AM'"))
            assert(el3s.count == 1)
            let el3 = el3s.element(boundBy: 0)
            let el4s = app.cells.containing(NSPredicate(format: "label LIKE[c] '4:51 PM'"))
            assert(el4s.count == 1)
            let el4 = el4s.element(boundBy: 0)
            let el5s = app.cells.containing(NSPredicate(format: "label LIKE[c] '7:52 PM'"))
            assert(el5s.count == 1)
            let el5 = el5s.element(boundBy: 0)

            app.terminate()

        }

    }

    