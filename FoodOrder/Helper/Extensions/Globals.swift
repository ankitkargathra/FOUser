//
//  Globals.swift
//  GoodBuysShopper
//
//  Created by Dhaval Nena on 22/06/17.
//  Copyright © 2017 Agile. All rights reserved.
//


import Foundation
import UIKit
import CFNetwork
import WebKit






// MARK:- _______________ CUSTOM LOADER _______________
// MARK:







// MARK:-  _______________ SET MODEL DATA IN USERDEFAULTS _______________
// MARK:

func setModelDataInUserDefaults(key:String,value:Any){
    let data :Data = NSKeyedArchiver.archivedData(withRootObject: value)
    setUserDefaultsFor(object: data as AnyObject, with: key)
}

func getModelDataFromUserDefaults(key:String) -> Any? {
    if let object = getUserDefaultsForKey(key: key) {
        return NSKeyedUnarchiver.unarchiveObject(with: object as! Data)
    }
    return nil
}



// MARK:- _______________ PROPORTIONAL SIZE _______________
// MARK:


// MARK: - Get Proportional Type
func getProportionalWidth(width:CGFloat) -> CGFloat {
    return ((Devices.screenWidth * width)/750)
}
func getProportionalHeight(height:CGFloat) -> CGFloat {
    let screenHeight = Devices.deviceType == .iPhoneX ? Devices.screenHeight - (44 + 34) : Devices.screenHeight
    return ((screenHeight * height) / (2208 / 3))
}

func getProportionalFont(size:CGFloat) -> CGFloat {
    // As per 6 Plus
    return ((Devices.screenHeight * size) / (2208 / 3))
}


// MARK:- SYSTEM VERSION CHECK
// MARK:

func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
}


// MARK:- _______________ USER DEFAULTS _______________
// MARK:

func setUserDefaultsFor(object:AnyObject, with key:String) {
    UserDefaults.standard.set(object, forKey: key)
    UserDefaults.standard.synchronize()
}

func getUserDefaultsForKey(key:String) -> AnyObject? {
    return UserDefaults.standard.object(forKey: key) as AnyObject?
}

func removeUserDefaultsFor(key:String) {
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}


// MARK:- _______________ USER NOTIFICATION _______________
// MARK:

func postNotificatio_REGISTER(viewConroller:UIViewController,key:String,selector : Selector) {
    NotificationCenter.default.addObserver(viewConroller,
                                           selector: selector,
                                           name: NSNotification.Name(rawValue: key),
                                           object: nil)
}

func postNotificatio_CALL(key:String) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: key), object: nil)
}

func postNotificatio_REMOVE(viewConroller:UIViewController,key:String) {
    NotificationCenter.default.removeObserver(viewConroller,
                                              name: NSNotification.Name(rawValue: key),
                                              object: nil)
}


func drawLign(view: UIView, frame: CGRect, color: UIColor) {
    let doYourPath = UIBezierPath(rect: frame)
    let layer = CAShapeLayer()
    layer.path = doYourPath.cgPath
    layer.strokeColor = color.cgColor
    layer.fillColor = color.cgColor
    view.layer.addSublayer(layer)
}








