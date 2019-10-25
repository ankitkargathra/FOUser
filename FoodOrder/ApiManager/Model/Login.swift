//
//  Login.swift
//  Starbox
//
//  Created by Rohan on 26/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

//MARK: Login Requet

class Login {
    
    var email: String!
    var password: String!
    var usertype: String! = "user"
    var device_id: String! = "\(Devices.uuid)"
    var fcm_token: String! = "\(FCM_TOKEN)"
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func toJsonDictionary() -> JSONDICTIONARY {
        
        var dict: JSONDICTIONARY = [:]
        if let email = email { dict[LoginKey.email] = email }
        if let password = password { dict[LoginKey.password] = password }
        if let usertype = usertype { dict[LoginKey.usertype] = usertype }
        if let device_id = device_id { dict[LoginKey.device_id] = device_id }
        if let fcm_token = fcm_token { dict[LoginKey.fcm_token] = fcm_token }
        return dict
    }
    
}
