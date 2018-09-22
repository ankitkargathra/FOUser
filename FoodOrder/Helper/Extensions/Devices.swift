//
//  Devices.swift
//  Vachnamrut
//
//  Created by Bhautik Ziniya on 9/14/17.
//  Copyright © 2017 Agile Infoways. All rights reserved.
//

import UIKit

class Devices: NSObject {
    
    internal enum DeviceType {
        case iPhone4or4s
        case iPhone5or5s
        case iPhone6or6s
        case iPhone6por6sp
        case iPhoneX
        case iPad
    }
    
    // MARK: - Device is iPad
    static var isIpad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    // MARK: - Device is iPhone
    static var isIphone : Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    // MARK: - Device Screen Height
    static var screenHeight : CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    // MARK: - Device Screen Width
    static var screenWidth : CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    // MARK: - Device is Portrait
    static var isPortrait : Bool {
        return UIDevice.isPortrait
    }
    
    // MARK: - Device is Landscape
    static var isLandscape : Bool {
        return UIDevice.isLandscape
    }
    
    // MARK: - Get Device Type
    static var deviceType : DeviceType? {
        // Need to match width also because if device is in portrait mode height will be different.
        if Devices.screenHeight == 480 || Devices.screenWidth == 480 {
            return DeviceType.iPhone4or4s
        } else if Devices.screenHeight == 568 || Devices.screenWidth == 568 {
            return DeviceType.iPhone5or5s
        } else if Devices.screenHeight == 667 || Devices.screenWidth == 667{
            return DeviceType.iPhone6or6s
        } else if Devices.screenHeight == 736 || Devices.screenWidth == 736{
            return DeviceType.iPhone6por6sp
        } else if Devices.screenHeight == 812 || Devices.screenWidth == 812{
            return DeviceType.iPhoneX
        } else {
            return DeviceType.iPad
        }
    }
    
}

extension UIDevice {
    
    static var isPortrait : Bool {
        return UIDevice.current.orientation.isPortrait
    }
    
    static var isLandscape : Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    
}
