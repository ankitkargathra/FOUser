//
//  ForgotPasswordVC.swift
//  FoodOrder
//
//  Created by Rohan on 22/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class ForgotPasswordVC: BaseVC {

    @IBOutlet var txtEmail: RaisePlaceholder!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackGreen)
        super.viewDidLoad()
        txtEmail.validateTextField(type: .Email, minLength: 5, maxLength: 50, alignment: .left, placeHolder: "Email")
        // Do any additional setup after loading the view.
        #if DEBUG
        self.txtEmail.text = "ankitmistry7270@gmail.com"
        #endif
    }
    
    
    @IBAction func btnSendPress() {
        
        if txtEmail.validateTextFiled(validationMesage: .invalidEmail) {
            UtilityClass.showHUD()
            ApiController.shared.forgotPassword(email: txtEmail.text!) { (success, message, response) in
                UtilityClass.hideHUD()
                TOAST.showToast(str: message)
                if success == true {
                    self.popTo()
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
