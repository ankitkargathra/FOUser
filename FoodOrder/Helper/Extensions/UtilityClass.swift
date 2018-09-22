//
//  UtilityClass.swift
//  comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit


class UtilityClass {
    
    public static func printAllFont() {
        for family in UIFont.familyNames {
            
            let sName: String = family as String
            print("family: \(sName)")
            
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
    }
    
    public static func setStatusbarContent(style: UIStatusBarStyle) {
        // Set Status bar style
        UIApplication.shared.statusBarStyle = style
    }
    
    public static func setNavigationTitleColor(alpha:CGFloat = 1.0) -> UIColor {
        return UIColor.setColor(red: 95, green: 86, blue: 142, alpha: alpha)
    }
    
    public static func setCornerRadius(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.size.width / 2
    }
    /*
    public static func setPushAnimation(vc: UIViewController) {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        AppDel.getNavigationController().view.layer.add(transition, forKey: kCATransition)
        AppDel.getNavigationController().pushViewController(vc, animated: false)
    }
    
    public static func setPopAnimation() {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        AppDel.getNavigationController().view.layer.add(transition, forKey: kCATransition)
        AppDel.getNavigationController().popViewController(animated: false)
    }
    
    public static func disableIQKeyBoardForVC() {
        IQKeyboardManager.shared().disabledToolbarClasses.addObjects(from: [CreateEventViewController.self,EventDetailsViewController.self,GroupActivityDetailsViewController.self,ThreadDetailViewController.self,NewGroupViewController.self,EditRuleAndDescriptionViewController.self,ShareImageWithCaptionViewController.self,OnBoardingViewController.self])
    }
    
    public static func JTHUD(show:Bool) {
        DispatchQueue.main.async {
            if show {
                let loader = Loader(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                JTProgressHUD.show(with: loader)
                loader.startAnimating()
            } else {
                JTProgressHUD.hide(with: JTProgressHUDTransition.fade)
            }
        }
    }
    
    public static func setRootView() {
        
        let onboarding = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OnBoardingViewController") as! OnBoardingViewController
        let nvc = UINavigationController.init(rootViewController: onboarding)
        UIView.transition(with: AppDel.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
//            AppDel.window?.rootViewController = AppDel.tabBarVc
            AppDel.window?.rootViewController = nvc
        }, completion: nil)
    }
    
    public static func setTabController() {
        DispatchQueue.main.async {
            UIView.transition(with: AppDel.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                AppDel.window?.rootViewController = AppDel.tabBarVc
                AppDel.tabBarVc.selectedIndex = 1
            }, completion: nil)
        }
    }
 */
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
} 
