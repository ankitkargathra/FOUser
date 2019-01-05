//
//  UserDefaultClass.swift
//  Starbox
//
//  Created by Rohan on 28/07/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    //MARK: Save CurrentUSer  data
    class func saveCurrentUserData(user: JSONDICTIONARY) {
        let userData = NSKeyedArchiver.archivedData(withRootObject: user)
        self.standard.set(userData, forKey: "kAPPUser")
        self.standard.synchronize()
    }
    
    class func setUserData() {
        if let userData = UserDefaults.standard.object(forKey: "kAPPUser") as? Data {
            if let user = NSKeyedUnarchiver.unarchiveObject(with: userData) as? JSONDICTIONARY {
                print(user)
                LoggedinUser.shared.parseJsonDictionary(dict: user)
            }
        }
    }
    
    class func removeUserDefultData() {
        let domain = Bundle.main.bundleIdentifier!
        self.standard.removePersistentDomain(forName: domain)
        self.standard.synchronize()
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
