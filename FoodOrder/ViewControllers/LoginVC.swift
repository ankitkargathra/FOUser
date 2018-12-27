//
//  LoginVC.swift
//  FoodOrder
//
//  Created by Rohan on 17/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    
    //---------------------------------------------
    //MARK:- Variable Declaration
    //---------------------------------------------
    
    @IBOutlet weak var btnSignIn: GreenBGButton!
    @IBOutlet weak var btnSignInWithFb: UIButton!
    
    @IBOutlet weak var txtEmail: RaisePlaceholder!
    @IBOutlet weak var txtPassword: RaisePlaceholder!
    
    @IBOutlet weak var constraint_ButtonSignInTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setRightBarButtonItem(title: "Sign Up", selector: #selector(self.btnSignUpPress))
        constraint_ButtonSignInTop.constant = IS_iPHONE_5 ? 10 : 0
        txtEmail.validateTextField(type: .Email, minLength: 10, maxLength: 100, alignment: .left, placeHolder: "Email")
        txtEmail.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 15.7))
        txtPassword.validateTextField(type: .Password, minLength: 5, maxLength: 100, alignment: .left, placeHolder: "Password")
        txtPassword.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 15.7))
        btnSignInWithFb.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 17))
        self.setLeftBArButtonNIl()
        #if DEBUG
        self.txtEmail.text = "virendra.solulab@gmail.com"
        self.txtPassword.text = "123456"
        #endif
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignInPress() {
        
        
        if txtEmail.validateTextFiled(validationMesage: .invalidEmail) {
            if txtPassword.validateTextFiled(validationMesage: .invalidPassLength) {
                dismissKeyboard()
                let loginUser = Login.init(email: txtEmail.text!, password: txtPassword.text!)
                UtilityClass.showHUD()
                ApiController.shared.loginUser(login: loginUser) { (isSuccess, message, response) in
                    UtilityClass.hideHUD()
                    if isSuccess {
                        TOAST.showToast(str: message)
                        LoggedinUser.shared.parseJsonDictionary(dict: response! as JSONDICTIONARY)
                        
                        let homeVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                        self.navigationController?.pushViewController(homeVC, animated: true)
                    } else {
                        TOAST.showToast(str: message)
                    }
                }
            }
        }
    }
    
    @IBAction func loginWithFbPress() {
        LoginWithFB.shared.login(vc: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
