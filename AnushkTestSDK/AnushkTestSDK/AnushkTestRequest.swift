//
//  AnushkTestRequest.swift
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 10/15/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

import Foundation

func completeSessionWithUpload() {
    // one large json request
    
    //Step 1: associate this request with an app id & request timestamp
    var dict = ["appID": AnushkTestSDKManager.shared.appID,
                "timestamp": Int(Date().timeIntervalSince1970),
                "timesincebootup_ref": AnushkTestSDKManager.shared.time_on_init] as [String : Any]
    
    //Step 2: append all the manually taken screenshots at each timestamp
    var screenshot_arr: [String: String] = [:]
    for (timestamp, image) in AnushkTestSDKManager.shared.manualScreenshots {
        screenshot_arr[String(timestamp)] = image.pngData()!.base64EncodedString()
    }
    dict["manual_screenshots"] = screenshot_arr
    
    //Step 3: add all the logger details for each logger
    var log_arr: [[String: Any]] = []
    AnushkTestSDKManager.shared.lastLoggers.removeLast() // remove the additional logger
    for logger in AnushkTestSDKManager.shared.lastLoggers {
        if logger.action.isEmpty && !logger.isAnAssertionLog { // no action and not assertion => excess log
            continue
        }
        var log_item: [String: Any] = [:]
        log_item["logger_timesincebootup"] = String(logger.timesincestartup_on_end) //NOTE:// this is set on logger end which is when the logger event is done
        log_item["event_timesincebootup"] = String(logger.timeStamp) //NOTE:// time in s since system start
        log_item["comments"] = String(logger.comments)

        log_item["isFloatButton"] = String(logger.isFloatButton)
        log_item["isAnAssertionLog"] = String(logger.isAnAssertionLog)
        
        log_item["isUIControl"] = String(logger.isUIControl)
        log_item["stateUIControl"] = String(logger.stateUIControl)
        log_item["isEnabled"] = String(logger.isEnabled)
        log_item["isSelected"] = String(logger.isSelected)
        log_item["isHighlighted"] = String(logger.isHighlighted)
        log_item["bounds"] = String(logger.bounds)
        log_item["constrains"] = String(logger.constrains)
        log_item["tags"] = String(logger.tags)
        log_item["accessibilityLabell"] = String(logger.accessibilityLabell)
        log_item["accessibilityFramee"] = String(logger.accessibilityFramee)
        
        log_item["allClicksLogged"] = String(logger.allClicksLogged)
        log_item["eventType"] = String(logger.eventType)

        log_item["viewDetails"] = String(logger.viewDetails)
        log_item["superView"] = String(logger.superView)
        log_item["superViewBound"] = String(logger.superViewBound)
        log_item["superViewConstrain"] = String(logger.superViewConstrain)
        log_item["superViewTag"] = String(logger.superViewTag)
        log_item["receiverSubview"] = String(logger.receiverSubview)
        log_item["receiverWindow"] = String(logger.receiverWindow)
        log_item["maskView"] = String(logger.maskView)
        log_item["uiTouchPhase"] = String(logger.uiTouchPhase)
        log_item["tapCount"] = String(logger.tapCount)
        log_item["maxPossForce"] = String(logger.maxPossForce)
        log_item["typeOfTouch"] = String(logger.typeOfTouch)
        log_item["gestureRecognizers"] = String(logger.gestureRecognizers)

        log_item["tree"] = String(logger.tree)
        log_item["action"] = String(logger.action)
        log_item["gestureRecognizers"] = String(logger.gestureRecognizers)
        if let s = logger.screenshot {
            log_item["screenshot"] = s.pngData()!.base64EncodedString()
        }
        
        // Step 4: add all assert checks associated with the action / assert log
        log_item["assert_items"] = logger.assert_items
        
        log_arr.append(log_item)
    }
    
    dict["log_data"] = log_arr
    
    HTTP.POST("https://7e9caafde06d.ngrok.io/add_session", parameters: dict, headers: ["Content-Type":"application/json"], requestSerializer: JSONParameterSerializer()) { response in
        
        if let error = response.error {
            print("got an error: \(error)")
            return
        }
        
        do {
            let json = try JSON(data: response.data)
            print(json)
        } catch {
            print("catched an unknown error :(")
        }
        
    }
    
}

func bootTime() -> Date? {
    var tv = timeval()
    var tvSize = MemoryLayout<timeval>.size
    let err = sysctlbyname("kern.boottime", &tv, &tvSize, nil, 0);
    guard err == 0, tvSize == MemoryLayout<timeval>.size else {
        return nil
    }
    return Date(timeIntervalSince1970: Double(tv.tv_sec) + Double(tv.tv_usec) / 1_000_000.0)
}
