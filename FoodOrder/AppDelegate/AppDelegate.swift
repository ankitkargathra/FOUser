//
//  AppDelegate.swift
//  FoodOrder
//
//  Created by Rohan on 28/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import FacebookLogin
import FacebookCore
import Firebase
import UserNotificationsUI
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    var deviceToken: String! = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setSideMenuVCwithHome()
//        FirebaseApp.configure()
        registerNotification(application: application)
//        Messaging.messaging().delegate = self
        
        if let token = UserDefaults.standard.object(forKey: DEVICETOKEN) as? String {
            self.deviceToken = token
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
    }
    
    func registerNotification(application: UIApplication) {
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                // Enable or disable features based on authorization.
                if granted {
                }
            }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        self.deviceToken = token
        UserDefaults.standard.set(token, forKey: DEVICETOKEN)
//        Messaging.messaging().apnsToken = deviceToken
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func setSideMenuVCwithHome(identifiire: String = "IntroViewController") {
        
        UserDefaults.setUserData()
        
        var identifireVC = identifiire
        
        if UserDefaults.standard.bool(forKey: "IntroViewController") == false {
            UserDefaults.standard.set(true, forKey: "IntroViewController")
            identifireVC = "IntroViewController"
        } else {
            
            if LoggedinUser.shared.access_token != nil {
                identifireVC =  "HomeVC"//"FoodCourtDetailVC"//
            } else {
                identifireVC = "LoginVC"
            }            
        }
        
        
        let mainVC = SJSwiftSideMenuController()
        let sideMenuVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "SideMenuVC") as! SideMenuVC
        //IntroViewController
        let homeVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: identifireVC)
//        let nvc = UINavigationController.init(rootViewController: homeVC)
        SJSwiftSideMenuController.setUpNavigation(rootController: homeVC, leftMenuController: sideMenuVC, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideView)
//        SJSwiftSideMenuController.enableSwipeGestureWithMenuSide(menuSide: .LEFT)
        SJSwiftSideMenuController.enableDimbackground = true
        SJSwiftSideMenuController.leftMenuWidth = getProportionalWidth(width: 314)
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
    }
    
    

}

