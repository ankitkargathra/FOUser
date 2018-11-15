//
//  LoggedinUser.swift
//  Starbox
//
//  Created by Rohan on 26/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

//MARK: Login Response

class LoggedinUser {
    
    static let shared: LoggedinUser = LoggedinUser()
    
    //MARK: Variable List
    var id: INT_JSON!
    var fullname: String?
    var picture: String?
    var access_token: String?
    
    init() {
    }
    
    func parseJsonDictionary(dict: JSONDICTIONARY) {
        
        if let id = dict["id"] as? INT_JSON {
            self.id = id
        }
        
        if let fullname = dict["fullname"] as? String {
            self.fullname = fullname
        }
        
        if let picture = dict["picture"] as? String {
            self.picture = picture
        }
        
        if let access_token = dict["access_token"] as? String {
            self.access_token = access_token
        }
        
    }
    
    
    func getAuth() -> [String:String] {
        return ["Authorization":"\(self.access_token!)"]
    }
    
    func removeallData() {
        id = nil
        fullname = nil
        picture = nil
        access_token = nil
    }
    
    /*
     {
     "status": "200",
     "message": "Login Successfully!!",
     "data": {
     "id": "3",
     "fullname": "test user",
     "picture": "",
     "access_token": "do470ywygbiu1zhxmxspl2p6e0jlgkzu"
     }
     }
     */
}
