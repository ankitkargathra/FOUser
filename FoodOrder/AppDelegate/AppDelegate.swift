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


var FCM_TOKEN = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    var deviceToken: String! = ""
    var FoodCourtId:Int!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        configureForPushNotification(application: application)
        self.setSideMenuVCwithHome()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
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
                identifireVC = "HomeVC"//"FoodCourtDetailVC"//
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

extension AppDelegate:UNUserNotificationCenterDelegate{
    //MARK: - Push Notification Delegate -
    
    func configureForPushNotification(application : UIApplication){
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
    }
    
    func navigateTo(isNavigate : Bool = false, orderId:String! = "", orderStatusUpdate:Bool! = false) {
      
        let rootVC = self.window?.rootViewController
        var navVc : UINavigationController?
        
        if rootVC!.isKind(of: SJSwiftSideMenuController.self){
            navVc =  rootVC as? UINavigationController
        }else if rootVC!.isKind(of: UINavigationController.self){
            navVc = rootVC as? UINavigationController
        }
        if orderStatusUpdate{
            if navVc != nil && navVc!.isKind(of: UINavigationController.self) && navVc!.topViewController!.isKind(of: OrderDetailVC.self) {
                let orderVC = navVc!.topViewController! as! OrderDetailVC
                orderVC.orderId = orderId
                navVc?.pushViewController(orderVC, animated: true)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void){
        let data = notification.request.content.userInfo
        print(data)
        completionHandler([.alert,.sound,.badge]) // show notification when app is active
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void){
        let data = response.notification.request.content.userInfo
        print(data)
//        if let orderId = data[AnyHashable("order_id")] as? String{
//            navigateTo(isNavigate: true, orderId:orderId, orderStatusUpdate:true)
//            return
//        }
    }
    
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        Messaging.messaging().apnsToken = deviceToken
    }
    
//    To get Fcm token for testing in a single devices
//    InstanceID.instanceID().instanceID { (result, error) in
//    if let error = error {
//    print("Error fetching remote instange ID: \(error)")
//    } else if let result = result {
//    print("Remote instance ID token: \(result.token)")
//    }
//    }
    //    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    //    {
    //        print(userInfo as! JSONDICTIONARY)
    //        if UIApplication.shared.applicationState == .active {
    //            print("TESTED ***** FOREGROUND **** TESTED")
    //        }else{
    //            print("TESTED ***** BACKGROUND **** TESTED")
    //        }
    //    }
}

extension AppDelegate : MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        FCM_TOKEN = fcmToken
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage)
    {
        print(remoteMessage.appData)
        
        if let userInfo = remoteMessage.appData as? [String: Any]
        {
            print(userInfo)
        }
    }
}
