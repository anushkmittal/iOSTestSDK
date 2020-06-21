
    //
    //  AnushkTestSDK-1591652189.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-08 for com.example.apple-samplecode.UIKitCatalog.
    // 

    import XCTest

    class AnushkTestSDK1591652189: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0s = app.cells.containing(NSPredicate(format: "label LIKE[c] 'Buttons'"))
            assert(el0s.count == 1)
            let el0 = el0s.element(boundBy: 0)
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["Button"]
            XCTAssertTrue(el1.exists)
            el1.tap()

            app.terminate()

        }

    }

    