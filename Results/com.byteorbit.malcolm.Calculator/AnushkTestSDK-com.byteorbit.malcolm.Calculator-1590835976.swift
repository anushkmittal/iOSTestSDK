
    //
    //  AnushkTestSDK-1590835976.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-05-30 for com.byteorbit.malcolm.Calculator.
    // 

    import XCTest

    class AnushkTestSDK1590835976: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication()
            app.launch()        
            
            let el0 = app.buttons["0"]
            XCTAssertTrue(el0.exists)
            el0.tap()
            let el1 = app.buttons["+"]
            XCTAssertTrue(el1.exists)
            el1.tap()
            let el2 = app.buttons["1"]
            XCTAssertTrue(el2.exists)
            el2.tap()
            let el3 = app.buttons["="]
            XCTAssertTrue(el3.exists)
            el3.tap()
            let el4 = app.buttons["."]
            XCTAssertTrue(el4.exists)
            el4.tap()
            let el5 = app.buttons["2"]
            XCTAssertTrue(el5.exists)
            el5.tap()
            let el6 = app.buttons["3"]
            XCTAssertTrue(el6.exists)
            el6.tap()
            let el7 = app.buttons["4"]
            XCTAssertTrue(el7.exists)
            el7.tap()
            let el8 = app.buttons["5"]
            XCTAssertTrue(el8.exists)
            el8.tap()
            let el9 = app.buttons["6"]
            XCTAssertTrue(el9.exists)
            el9.tap()
            let el10 = app.buttons["7"]
            XCTAssertTrue(el10.exists)
            el10.tap()
            let el11 = app.buttons["8"]
            XCTAssertTrue(el11.exists)
            el11.tap()
            let el12 = app.buttons["9"]
            XCTAssertTrue(el12.exists)
            el12.tap()
            let el13 = app.buttons["-"]
            XCTAssertTrue(el13.exists)
            el13.tap()
            let el14 = app.buttons["/"]
            XCTAssertTrue(el14.exists)
            el14.tap()
            let el15 = app.buttons["*"]
            XCTAssertTrue(el15.exists)
            el15.tap()
            let el16 = app.buttons["C"]
            XCTAssertTrue(el16.exists)
            el16.tap()
            let el17 = app.buttons["AC"]
            XCTAssertTrue(el17.exists)
            el17.tap()

            app.terminate()

        }

    }

    