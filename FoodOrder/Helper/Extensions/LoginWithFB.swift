//
//  LoginWithFB.swift
//  FoodOrder
//
//  Created by Rohan on 15/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class LoginWithFB {
    
    static let shared: LoginWithFB = LoginWithFB()
    let user = SignUp()
    
    func login(vc: UIViewController) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ReadPermission.email, ReadPermission.publicProfile], viewController: vc) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                let params = ["fields":"name,email,first_name,last_name,gender,picture.type(large),birthday"]
                let graphRequest = GraphRequest(graphPath: "me", parameters: params)
                
                graphRequest.start
                    { (urlResponse, requestResult) in
                        switch requestResult
                        {
                        case .failed(let error):
                            print(error)
                        case .success(let graphResponse):
                            print(requestResult)
                            
                            if let dict = graphResponse.dictionaryValue as JSONDICTIONARY? {
                                
                                
                                self.user.usertype = "user"
                                if let fullname = dict["name"] as? String {
                                    self.user.fullname = fullname
                                }
                                
                                if let facebook_id = dict["id"] as? String {
                                    self.user.facebook_id = facebook_id
                                }
                                
                                if let email = dict["email"] as? String {
                                    self.user.email = email
                                    if self.user.email.trim().count != 0 {
                                        self.loginwithFb(vc: vc)
                                    } else {
                                        self.openEmailTextFieldAlert(vc: vc)
                                    }
                                } else {
                                    self.openEmailTextFieldAlert(vc: vc)
                                }
                            }
                            break
                        }
                }
            }
        }
    }
    
    func openEmailTextFieldAlert(vc: UIViewController) {
        let alertController = UIAlertController(title: kAppName, message: "Please enter your email.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "email address"
        }
        
        let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default) { (action) in
            let textfield = alertController.textFields![0]
            if textfield.text?.trim().count == 0 {
                TOAST.showToast(str: "Please enter email address")
            } else {
                self.loginwithFb(vc: vc)
            }
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alertController.addAction(okAction)
        alertController.addAction(cancel)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    func loginwithFb(vc: UIViewController) {
        UtilityClass.showHUD()
        ApiController.shared.registerUserWithFb(user: user) { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                LoggedinUser.shared.parseJsonDictionary(dict: response! as JSONDICTIONARY)
                let homeVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.navigationController?.pushViewController(homeVC, animated: true)
            }
        }        
    }
}
