//
//  URLClass.swift
//  Deals en Route Business
//
//  Created by Ankit on 11/27/17.
//  Copyright © 2017 Solulab. All rights reserved.
//

import Foundation

// Main URL
let MAINURL = "http://13.233.29.215/api/v1/"


enum MethodType: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}


struct URLClass {
    static let kLogin                   = "\(MAINURL)login"
    static let kForgotPassword          = "\(MAINURL)forgotPassword"
    static let kregister                = "\(MAINURL)register"
    static let kloginWithFB             = "\(MAINURL)loginWithFB"
}
