//
//  Constant.swift
//  Comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

public let kAppName      = "EPOP"

let AppDel               = UIApplication.shared.delegate as! AppDelegate
let kPresentedViewHeight = UIScreen.main.bounds.size.height
let kPresentedViewWidth  = UIScreen.main.bounds.size.width
let kDeviceFrame         = AppDel.window!.bounds

//-------------------------------------------------//
//------------#    Device Check   #----------------//
//-------------------------------------------------//

let IS_iPHONE_4         = UIScreen.main.bounds.size.height == 480 ? true : false as Bool
let IS_iPHONE_5         = UIScreen.main.bounds.size.height == 568 ? true : false as Bool
let IS_iPHONE_6         = UIScreen.main.bounds.size.height == 667 ? true : false as Bool
let IS_iPHONE_6_plus    = UIScreen.main.bounds.size.height == 736 ? true : false as Bool
let IS_iPad             = UIScreen.main.bounds.size.height == 1024 ? true : false as Bool
let IS_iPHONE_X         = UIScreen.main.nativeBounds.height == 2436 ? true : false as Bool

// Get device UDID
let device_id           = UIDevice.current.identifierForVendor!.uuidString

//-------------------------------------------------//
//------------#   General Const.  #----------------//
//-------------------------------------------------//

let kYES                                = "YES"
let kNO                                 = "NO"
var k_Language                          = "en"
let DEVICETOKEN                         = "token"
//-------------------------------------------------//
//-------------#   Storyboards   #-----------------//
//-------------------------------------------------//

let MAIN_STORYBOARD         = UIStoryboard.init(name: "Main", bundle: nil)
let SIDE_MENU_STORYBOARD     = UIStoryboard.init(name: "SideMenu", bundle: nil)
let STORYBOARD_LOGIN     = UIStoryboard.init(name: "LoginVC", bundle: nil)

//-------------------------------------------------//
//-------#   Navigation And bottom Button   #------//
//-------------------------------------------------//

// Navigation top buttons type

enum MenuType {
    case Menu
    case Back
    case Serch
    case BackAndSearch
    case MenuAndSearch
    case BackAndAdd
}

enum NavigationButtons {
    case Menu
    case Back
    case Search
    case Add
    var image: UIImage {
        switch self {
        case .Menu: return #imageLiteral(resourceName: "Nvc_Menu")
        case .Back: return #imageLiteral(resourceName: "Nvc_Back")
        case .Search: return #imageLiteral(resourceName: "Nvc_Search")
        case .Add: return #imageLiteral(resourceName: "Nvc_Add")
        }
    }
    
}


/*---------------------------------------------------------*/
/*--------------- # Type alias # ----------------*/
/*---------------------------------------------------------*/

typealias INT_JSON = Int32
typealias JSONDICTIONARY = [String: Any]

enum FeedType: String {
    case Event = "Event"
    case Group = "Group"
    case Post = "Post"
}

let kPageSize = 10

/*---------------------------------------------------------*/
/*-------------------- # Api Constant # -------------------*/
/*---------------------------------------------------------*/
//MARK: Api Constant

struct LoginKey {
    static let email                    = "email"
    static let password                 = "password"
    static let fcm_token                = "fcm_token"
    static let device_id                = "device_id"
    static let usertype                 = "usertype"
    static let userId                   = "userId"
    static let userName                 = "userName"
    static let insertDate               = "insertDate"
    static let userImage                = "userImage"
    static let type                     = "type"
    static let isActive                 = "isActive"
    static let city                     = "city"
    static let country                  = "country"
    static let phoneNumber              = "phoneNumber"
}

func checkNULL(str: String?) -> String {
    return (str == nil) ? "" : str!
}
