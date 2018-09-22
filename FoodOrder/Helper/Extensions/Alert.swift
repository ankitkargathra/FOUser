//
//  Alert.swift
//  comon
//
//  Created by Ankit on 15/03/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showAlertWith(title: String = kAppName, message: String) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertActionOK = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertActionOK)
        AppDel.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    class func logoutAlert(title: String = kAppName, message: String) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertActionOK = UIAlertAction.init(title: "YES", style: .default) { (action) in
//            AppDel.setRootViewSideMenu()
        }
        
        alertController.addAction(alertActionOK)
        let alertActionNO = UIAlertAction.init(title: "NO", style: .default, handler: nil)
        alertController.addAction(alertActionNO)
        AppDel.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    class func showNetworlAlert() {
//        Alert.showAlertWith(message: AppAlertMessages.message_InternetNotAvailable)
    }
    
}
