//
//  AnushkTestSDKTests.swift
//  AnushkTestSDKTests
//
//  Created by Anushk Mittal on 3/8/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import XCTest
import UIKit
@testable import AnushkTestSDK

class AnushkTestSDKTests: XCTestCase {
    
    var sharedManager: AnushkTestSDK = AnushkTestSDKManager.shared
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sharedManager.login(applicationID: "com.testing.AnushkTestSDK",
                            allowScreenshots: true,
                            logAllTouches: true,
                            showButton: false,
                            enableConsoleLogging: true,
                            saveScreenshotsLocally: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        XCTAssertEqual(sharedManager.appID, "com.testing.AnushkTestSDK")
        XCTAssertEqual(sharedManager.enableScreenshot, true)
        XCTAssertEqual(sharedManager.logAllTouch, true)
        XCTAssertEqual(sharedManager.showFloatButton, false)
        XCTAssertEqual(sharedManager.DEBUGGING, true)
        XCTAssertEqual(sharedManager.saveScreenshotsLocally, true)
    }
    
    func testLogger() {
        // Simulate sample log values
        let logger = AnushkTestSDKLogger()
        sharedManager.lastLoggers.append(logger)
        logger.firstLogEvent(allClicksLogged: "true", eventType: "some event type")
        
        logger.secondLogEvent(viewDetails: "viewDetails", superView: "superView", superViewBound: "superViewBound", superViewConstrain: "superViewConstrain", superViewTag: "superViewTag", receiverSubview: "receiverSubview", receiverWindow: "receiverWindow", maskView: "maskView", uiTouchPhase: "uiTouchPhase", tapCount: "tapCount", maxPossForce: "maxPossForce", timeStamp: "timeStamp", typeOfTouch: "typeOfTouch", gestureRecognizers: "gestureRecognizers")
        
        let event = UIEvent()
        let sender: AnyObject = UILabel()
        logger.thirdLogEvent(action: "", sender: sender, event: event)
        
        logger.fourthLogEvent(isUIControl: "true", stateUIControl: "some state", isEnabled: "true", isSelected: "true", isHighlighted: "true", bounds: "some bounds", constrains: "some constrains", tags: "some tags", accessibilityLabel: "some accessibility level", accessibilityFrame: "some frame")
        
        // assert recorded values
        XCTAssertEqual(sharedManager.appID, "com.testing.AnushkTestSDK")
        XCTAssertNotNil(sharedManager.lastLoggers.last)
        XCTAssertEqual(sharedManager.lastLoggers.last?.isUIControl, "true")
        XCTAssertEqual(sharedManager.lastLoggers.last?.stateUIControl, "some state")
        XCTAssertEqual(sharedManager.lastLoggers.last?.isEnabled, "true")
        XCTAssertEqual(sharedManager.lastLoggers.last?.isSelected, "true")
        XCTAssertEqual(sharedManager.lastLoggers.last?.isHighlighted, "true")
        XCTAssertEqual(sharedManager.lastLoggers.last?.bounds, "some bounds")
        XCTAssertEqual(sharedManager.lastLoggers.last?.constrains, "some constrains")
        XCTAssertEqual(sharedManager.lastLoggers.last?.tags, "some tags")
        XCTAssertEqual(sharedManager.lastLoggers.last?.accessibilityLabell, "some accessibility level")
        XCTAssertEqual(sharedManager.lastLoggers.last?.accessibilityFramee, "some frame")
        XCTAssertEqual(sharedManager.lastLoggers.last?.allClicksLogged, "true")
        XCTAssertEqual(sharedManager.lastLoggers.last?.eventType, "some event type")
        XCTAssertEqual(sharedManager.lastLoggers.last?.viewDetails, "viewDetails")
        XCTAssertEqual(sharedManager.lastLoggers.last?.superView, "superView")
        XCTAssertEqual(sharedManager.lastLoggers.last?.superViewBound, "superViewBound")
        XCTAssertEqual(sharedManager.lastLoggers.last?.superViewConstrain, "superViewConstrain")
        XCTAssertEqual(sharedManager.lastLoggers.last?.superViewConstrain, "superViewConstrain")
        XCTAssertEqual(sharedManager.lastLoggers.last?.superViewTag, "superViewTag")
        XCTAssertEqual(sharedManager.lastLoggers.last?.receiverSubview, "receiverSubview")
        XCTAssertEqual(sharedManager.lastLoggers.last?.receiverWindow, "receiverWindow")
        XCTAssertEqual(sharedManager.lastLoggers.last?.maskView, "maskView")
        XCTAssertEqual(sharedManager.lastLoggers.last?.uiTouchPhase, "uiTouchPhase")
        XCTAssertEqual(sharedManager.lastLoggers.last?.tapCount, "tapCount")
        XCTAssertEqual(sharedManager.lastLoggers.last?.maxPossForce, "maxPossForce")
        XCTAssertEqual(sharedManager.lastLoggers.last?.timeStamp, "timeStamp")
        XCTAssertEqual(sharedManager.lastLoggers.last?.typeOfTouch, "typeOfTouch")
        XCTAssertEqual(sharedManager.lastLoggers.last?.gestureRecognizers, "gestureRecognizers")
        XCTAssertEqual(sharedManager.lastLoggers.last?.action, "")
        XCTAssertNotNil(sharedManager.lastLoggers.last?.senderOld)
        XCTAssertEqual(sharedManager.lastLoggers.last?.event, event)
    }
    
    func testScreenshotImage() {
        
        let DynamicView=UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        DynamicView.backgroundColor=UIColor.green
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        
        let img =  UIImage.init(view: DynamicView)
        
        XCTAssertTrue(image(image1: img , isEqualTo: img))
    }
    
    
    func testServerLogger() {
        let DynamicView=UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        DynamicView.backgroundColor=UIColor.green
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        let img =  UIImage.init(view: DynamicView)
        
        let logger = AnushkTestSDKLogger()
        
        logger.firstLogEvent(allClicksLogged: "true", eventType: "some event type")
        
        logger.secondLogEvent(viewDetails: "viewDetails", superView: "superView", superViewBound: "superViewBound", superViewConstrain: "superViewConstrain", superViewTag: "superViewTag", receiverSubview: "receiverSubview", receiverWindow: "receiverWindow", maskView: "maskView", uiTouchPhase: "uiTouchPhase", tapCount: "tapCount", maxPossForce: "maxPossForce", timeStamp: "timeStamp", typeOfTouch: "typeOfTouch", gestureRecognizers: "gestureRecognizers")
        
        logger.fourthLogEvent(isUIControl: "true", stateUIControl: "some state", isEnabled: "true", isSelected: "true", isHighlighted: "true", bounds: "some bounds", constrains: "some constrains", tags: "some tags", accessibilityLabel: "some accessibility level", accessibilityFrame: "some frame")

        
        let req1 = AnushkTestSDKRequest(action: "", element: "", tree: "", controlActions: [""], comment: "", loggerDetails: logger)
        let req2 = AnushkTestSDKRequest(action: "", element: "", tree: "", controlActions: [""], screenshot: img, comment: "", loggerDetails: logger)
        
        XCTAssertEqual(req1.loggerDetails, logger)
        XCTAssertEqual(req2.loggerDetails, logger)
        
        XCTAssertEqual(req1.action, "")
        XCTAssertEqual(req1.element, "")
        XCTAssertEqual(req1.tree, "")
        XCTAssertEqual(req1.controlActions, [""])
        XCTAssertEqual(req1.comment, "")
        XCTAssertEqual(req1.screenshot, nil)
        
        XCTAssertEqual(req2.action, "")
        XCTAssertEqual(req2.element, "")
        XCTAssertEqual(req2.tree, "")
        XCTAssertEqual(req2.controlActions, [""])
        XCTAssertEqual(req2.comment, "")
        XCTAssertEqual(req2.screenshot, img)
    }
    
}

extension UIImage{
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

