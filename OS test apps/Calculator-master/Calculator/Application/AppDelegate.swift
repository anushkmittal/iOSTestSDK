//
//  AppDelegate.swift
//  Calculator
//
//  Created by Malcolm Kumwenda on 2017/09/18.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit
#if DEBUG
//import AnushkTestSDK
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CalculatorVC()
        window?.makeKeyAndVisible()
        
        #if DEBUG
        AnushkTestSDKManager.shared.login(applicationID: "com.byteorbit.malcolm.Calculator", //get from plist
                                      allowScreenshots: true, //log screenshots
                                      logAllTouches: true,
                                      showButton: true,
                                      enableConsoleLogging: false, // debug / verbose
                                      saveScreenshotsLocally: true) // saving to file locally*/
        #endif
        
        return true
    }
}

