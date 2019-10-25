//
//  SignUp.swift
//  FoodOrder
//
//  Created by Rohan on 14/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation

class SignUp {
    
    
    var fullname: String!
    var email: String!
    var password: String!
    var phone: String!
    var dob: String!
    var device_id: String! = "\(Devices.uuid)"
    var fcm_token: String! = "\(FCM_TOKEN)"
    var usertype: String?
    var facebook_id: String?
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let email = email { dict[LoginKey.email] = email }
        if let password = password { dict[LoginKey.password] = password }
        if let fullname = fullname { dict["fullname"] = fullname }
        if let device_id = device_id { dict[LoginKey.device_id] = device_id }
        if let fcm_token = fcm_token { dict[LoginKey.fcm_token] = fcm_token }
        if let dob = dob { dict["dob"] = dob }
        if let phone = phone { dict["phone"] = phone }
        if let usertype = usertype { dict["usertype"] = usertype }
        if let facebook_id = facebook_id { dict["facebook_id"] = facebook_id }
        return dict
    }
    
}
