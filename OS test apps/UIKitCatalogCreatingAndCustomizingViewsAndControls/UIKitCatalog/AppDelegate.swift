/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The application-specific delegate class.
*/

import UIKit
import AnushkTestSDK

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate, UISplitViewControllerDelegate {
    // MARK: - Properties

    var window: UIWindow?
	
	/** The detailViewManager is responsible for maintaining the UISplitViewController delegation
		and for managing the detail view controller of the split view.
	*/
	var detailViewManager = DetailViewManager()
	
    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		if let splitViewController = window!.rootViewController as? UISplitViewController {
            splitViewController.preferredDisplayMode = .allVisible
			splitViewController.delegate = detailViewManager
			detailViewManager.splitViewController = splitViewController
            
            // Set the master view controller table view with translucent background.
            splitViewController.primaryBackgroundStyle = .sidebar
            
            AnushkTestSDKManager.shared.login(applicationID: "com.example.apple-samplecode.UIKitCatalog", //get from plist
                                          allowScreenshots: true, //log screenshots
                                          logAllTouches: true,
                                          showButton: true,
                                          enableConsoleLogging: false, // debug / verbose
                                          saveScreenshotsLocally: true) // saving to file locally
        
        }
        
        return true
    }

}
