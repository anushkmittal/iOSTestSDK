//
//  AppDelegate.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 2/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import UIKit
import Firebase
import AnushkTestSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    var coming_from_launch = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        coming_from_launch = true
        // Override point for customization after application launch.
        FirebaseApp.configure()
           
       // if (!on_screen) {
            if let notificationData = launchOptions?[.remoteNotification] {
                // Use this data to present a view controller based
                // on the type of notification received
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "tvc")
                newViewController.modalPresentationStyle = .fullScreen
                self.window?.rootViewController = newViewController

                let newerViewController = storyBoard.instantiateViewController(withIdentifier: "edit_plan") as! EditPlanViewController
                newerViewController.modalPresentationStyle = .fullScreen
                            
                if(coming_from_launch && UserDefaults.standard.bool(forKey: "notif_pending")) {
                    UserDefaults.standard.set(false, forKey: "notif_pending")
                    if let doc_id = UserDefaults.standard.string(forKey: "notif_doc") {
                        UserDefaults.standard.removeObject(forKey: "notif_doc")
                        Plan.getPlan(id: doc_id) { (plan) in
                            if plan != nil {
                                plans.insert(plan!, at: 0)
                                
                                let friend_name = (plan!.owners.filter {$0 != User.shared!.username!}).first!
                                newerViewController.title = plan!.name + " (\(friend_name))"
                                
                                newerViewController.plan = plan!
                                newViewController.navigationController?.pushViewController(newerViewController, animated: true)
                                self.window?.makeKeyAndVisible()
                                return
                            }
                        }
                    }
                }
            }
       // }

        // For iOS 10 display notification (sent via APNS)
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        //self.window?.makeKeyAndVisible()        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // [START receive_message]
     func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
       // If you are receiving a notification message while your app is in the background,
       // this callback will not be fired till the user taps on the notification launching the application.
       // TODO: Handle data of notification
       // With swizzling disabled you must let Messaging know about the message, for Analytics
       // Messaging.messaging().appDidReceiveMessage(userInfo)
       // Print message ID.
       if let messageID = userInfo[gcmMessageIDKey] {
         print("Message ID: \(messageID)")
       }

       // Print full message.
       print(userInfo)
        
     }

     func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                      fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
       // If you are receiving a notification message while your app is in the background,
       // this callback will not be fired till the user taps on the notification launching the application.
       // TODO: Handle data of notification
       // With swizzling disabled you must let Messaging know about the message, for Analytics
       // Messaging.messaging().appDidReceiveMessage(userInfo)
       // Print message ID.
       if let messageID = userInfo[gcmMessageIDKey] {
         print("Message ID: \(messageID)")
       }

       // Print full message.
       print(userInfo)

       completionHandler(UIBackgroundFetchResult.newData)
     }
     // [END receive_message]
     func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
       print("Unable to register for remote notifications: \(error.localizedDescription)")
     }

     // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
     // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
     // the FCM registration token.
     func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       print("APNs token retrieved: \(deviceToken)")

       // With swizzling disabled you must set the APNs token here.
       // Messaging.messaging().apnsToken = deviceToken
     }


}


// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // Print full message.
    print(userInfo)
 
    UserDefaults.standard.set(true, forKey: "notif_pending")
    //on_screen = true//UserDefaults.standard.set(true, forKey: "on_screen")
    UserDefaults.standard.set(userInfo["doc_id"], forKey: "notif_doc")

    // Print full message.
    print(userInfo)
    completionHandler([.alert, .sound, .badge])
    
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    
    UserDefaults.standard.set(true, forKey: "notif_pending")
    UserDefaults.standard.set(userInfo["doc_id"], forKey: "notif_doc")

    // Print full message.
    print(userInfo)
    
    if(UserDefaults.standard.bool(forKey: "notif_pending")) {
        UserDefaults.standard.set(false, forKey: "notif_pending")
        if let doc_id = UserDefaults.standard.string(forKey: "notif_doc") {
            UserDefaults.standard.removeObject(forKey: "notif_doc")
            Plan.getPlan(id: doc_id) { (plan) in
                if plan != nil {
                    plans.insert(plan!, at: 0)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newerViewController = storyBoard.instantiateViewController(withIdentifier: "edit_plan") as! EditPlanViewController
                    newerViewController.modalPresentationStyle = .fullScreen
                    
                    let friend_name = (plan!.owners.filter {$0 != User.shared!.username!}).first!
                    newerViewController.title = plan!.name + " (\(friend_name))"
                    newerViewController.plan = plan!
                    
                    print(UIApplication.getTopViewController())
                    
                    UIApplication.getTopViewController()?.navigationController?.pushViewController(newerViewController, animated: true)

                    completionHandler()
                }
            }
        }
    }

  }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
  // [START refresh_token]
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    print("Firebase registration token: \(fcmToken)")
    if let su = User.shared {
        su.modifyDB {}
    }
    
    let dataDict:[String: String] = ["token": fcmToken]
    NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
  }
  // [END refresh_token]
  // [START ios_10_data_message]
  // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
  // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
  func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
    print("Received data message: \(remoteMessage.appData)")
  }
  // [END ios_10_data_message]
}


