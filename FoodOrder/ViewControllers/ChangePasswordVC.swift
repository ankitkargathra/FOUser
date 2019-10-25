//
//  ChangePasswordVC.swift
//  FoodOrder
//
//  Created by Rohan on 19/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class ChangePasswordVC: BaseVC {

    @IBOutlet weak var txtOldPassword: RaisePlaceholder!
    @IBOutlet weak var txtNewPassword: RaisePlaceholder!
    @IBOutlet weak var txtNewConfirmPass: RaisePlaceholder!
    
    override func viewDidLoad() {
        
        self.setNavigationButton(type: .BackCart)
        self.addTitleView(title: "Change Password", subtitle: nil)
        super.viewDidLoad()
        
        txtOldPassword.isSecureTextEntry = true
        txtNewPassword.isSecureTextEntry = true
        txtNewConfirmPass.isSecureTextEntry = true
        
        txtOldPassword.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"Old Password", isShowPassword: false)
        txtNewPassword.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"New Password", isShowPassword: false)
        txtNewConfirmPass.validateTextField(type: .Password, minLength: 6, maxLength: 30, alignment: .left, placeHolder:"Repeat New Password", isShowPassword: false)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnupdatePassPress(_ sender: Any) {
        self.view.endEditing(true)
        
        if txtOldPassword.validateTextFiled(validationMesage: .invalidPassLength) {
            if txtNewPassword.validateTextFiled(validationMesage: .invalidPassLength){
                if txtNewConfirmPass.validateTextFiled(validationMesage: .invalidPassLength) {
                    if txtNewPassword.text! == txtNewConfirmPass.text! {
                        ApiController.shared.updatePassword(oldPassword: txtOldPassword.text!, newPassword: txtNewConfirmPass.text!) { (success, message, response) in
                            if success {
                                self.popTo()
                            }
                            TOAST.showToast(str: message)
                        }
                    } else {
                        Alert.showAlertWith(message: "Password not match.")
                    }
                }
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
