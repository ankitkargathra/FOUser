//
//  SignUpVC.swift
//  FoodOrder
//
//  Created by Rohan on 23/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class SignUpVC: BaseVC, AlertViewButtonsDelegate {
   
    
    
    @IBOutlet weak var txtName: RaisePlaceholder!
    @IBOutlet weak var txtEmail: RaisePlaceholder!
    @IBOutlet weak var txtMobile: RaisePlaceholder!
    @IBOutlet weak var txtDOB: RaisePlaceholder!
    @IBOutlet weak var txtPassword: RaisePlaceholder!
    
    @IBOutlet var constraintVarticalSpace: [NSLayoutConstraint]!
    @IBOutlet var constraintVerticalY: NSLayoutConstraint!
    
    @IBOutlet weak var btnSignUp: GreenBGButton!
    @IBOutlet weak var btnSignInWithFb: UIButton!
    let user = SignUp()
    var isWithBackButton: Bool = true
    
    var alertButtons: AlertWithButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isWithBackButton {
            self.setNavigationButton(type: .BackGreen)
        } else {
            self.setLeftBArButtonNIl()
        }
        // Do any additional setup after loading the view.
        txtName.validateTextField(type: .Normal, minLength: 1, maxLength: 50, alignment: .left, placeHolder: "Name")
        txtEmail.validateTextField(type: .Email, minLength: 5, maxLength: 50, alignment: .left, placeHolder: "Email Address")
        txtPassword.validateTextField(type: .Password, minLength: 6, maxLength: 50, alignment: .left, placeHolder: "Password")
        txtMobile.validateTextField(type: .Mobile, minLength: 10, maxLength: 10, alignment: .left, placeHolder: "Mobile Number (Optional)")
        txtDOB.validateTextField(type: .BDate, minLength: 115, maxLength: 115, alignment: .left, placeHolder: "Date Of Birth (Optional)")
        
        for constraint in constraintVarticalSpace {
            constraint.constant = getProportionalHeight(height: 29)
        }
        constraintVerticalY.constant = getProportionalHeight(height: -11.5)
        
        btnSignInWithFb.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 17))
        self.setRightBarButtonItem(title: "Sign in", selector: #selector(self.signInPress))
    }
    
    @objc func signInPress() {
        
        for loginVC in self.navigationController!.viewControllers {
            if loginVC.isKind(of: LoginVC.classForCoder()) {
                self.navigationController?.popViewController(animated: true)
                return
            }
        }
        
        let loginVC = STORYBOARD_LOGIN.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    
    @IBAction func btnsignupPress() {
        
        if txtName.validateTextFiled(validationMesage: .EnterName) {
            if txtEmail.validateTextFiled(validationMesage: .EmptyEmailID) {
                if txtPassword.validateTextFiled(validationMesage: .invalidPassLength) {
                    
                    dismissKeyboard()
                    
                    let user = SignUp()
                    user.email = txtEmail.text!
                    user.password = txtPassword.text!
                    user.dob = txtDOB.text!
                    user.phone = txtMobile.text!
                    user.fullname = txtName.text!
                    UtilityClass.showHUD()
                    ApiController.shared.registerUser(user: user) { (success, message, response) in
                        
                        UtilityClass.hideHUD()
                        if success {
//                            LoggedinUser.shared.parseJsonDictionary(dict: response! as JSONDICTIONARY)
//                            let homeVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//                            self.navigationController?.pushViewController(homeVC, animated: true)
                            TOAST.showToast(str: message)
                            self.showAlertButtons(email: self.txtEmail.text!)
                        } else {
                            TOAST.showToast(str: message)
                        }
                        
                    }
                }
            }
        }
        
    }
    
    func showAlertButtons(email : String)
    {
        if alertButtons == nil{
            alertButtons = .fromNib() as AlertWithButtons
        }
        alertButtons?.alertButtonDelegate = self
        alertButtons?.lblEmail.text = email
        alertButtons?.frame = AppDel.window!.frame
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations:
            {
                AppDel.window?.rootViewController?.view.addSubview(self.alertButtons!)
                
        }, completion: nil)
    }
    
    func hideAlertButtons()
    {
        if let alertView = alertButtons{
            alertView.removeFromSuperview()
        }
        
//        if let vw = customInfoView{
//            vw.removeFromSuperview()
//        }
    }
    
    
    func btnNoTapped() {
        hideAlertButtons()
        self.signInPress()
    }
    
    func btnYesTapped() {
        UtilityClass.showHUD()
        ApiController.shared.resendEmail(email: self.txtEmail.text!) { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                self.btnNoTapped()
            }
            TOAST.showToast(str: message)
            
        }
    }
    
    @IBAction func loginButtonClicked() {
        
        LoginWithFB.shared.login(vc: self)
        return
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ReadPermission.email, ReadPermission.publicProfile], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                self.getFBUserData()
            }
        }
    }
    
    func getFBUserData()
    {
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
                                self.loginwithFb()
                            } else {
                                self.openEmailTextFieldAlert()
                            }
                        } else {
                            self.openEmailTextFieldAlert()
                        }
                    }
                    break
                }
        }
    }

    
    func openEmailTextFieldAlert() {
        let alertController = UIAlertController(title: kAppName, message: "Please enter your email.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "email address"
        }
        
        let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default) { (action) in
            let textfield = alertController.textFields![0]
            if textfield.text?.trim().count == 0 {
                TOAST.showToast(str: "Please enter email address")
            } else {
                self.loginwithFb()
            }
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alertController.addAction(okAction)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func loginwithFb() {
        UtilityClass.showHUD()
        ApiController.shared.registerUserWithFb(user: user) { (success, message, response) in
            UtilityClass.showHUD()
            if success {
                LoggedinUser.shared.parseJsonDictionary(dict: response! as JSONDICTIONARY)
                let homeVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
