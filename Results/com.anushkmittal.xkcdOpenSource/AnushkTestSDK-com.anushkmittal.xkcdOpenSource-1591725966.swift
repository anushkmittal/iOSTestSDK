
    //
    //  AnushkTestSDK-1591725966.swift
    //
    //  Automatically created by AnushkTestSDK
    //
    // Created on 2020-06-09 for com.anushkmittal.xkcdOpenSource.
    // 

    import XCTest

    class AnushkTestSDK1591725966: XCTestCase {

        func testSession() throws {
            let app = XCUIApplication(bundleIdentifier: "com.anushkmittal.xkcdOpenSource")
            app.launch()        
            
            let el0 = app.buttons["2317"]
            XCTAssert(el0.exists)
            XCTAssert(el0.label == "2317")
            let el1 = app.buttons["2312"]
            XCTAssert(el1.exists)
            XCTAssert(el1.label == "2312")
            let el2 = app.buttons["2316"]
            XCTAssert(el2.exists)
            XCTAssert(el2.label == "2316")
            let el3 = app.buttons["2315"]
            XCTAssert(el3.exists)
            XCTAssert(el3.label == "2315")
            let el4 = app.buttons["2314"]
            XCTAssert(el4.exists)
            XCTAssert(el4.label == "2314")
            let el5 = app.buttons["2313"]
            XCTAssert(el5.exists)
            XCTAssert(el5.label == "2313")
            let el6 = app.buttons["2310"]
            XCTAssert(el6.exists)
            XCTAssert(el6.label == "2310")
            let el7 = app.buttons["2309"]
            XCTAssert(el7.exists)
            XCTAssert(el7.label == "2309")

            app.terminate()

        }

    }

    