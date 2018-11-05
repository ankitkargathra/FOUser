//
//  SignUpVC.swift
//  FoodOrder
//
//  Created by Rohan on 23/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class SignUpVC: BaseVC {
    
    @IBOutlet weak var txtName: RaisePlaceholder!
    @IBOutlet weak var txtEmail: RaisePlaceholder!
    @IBOutlet weak var txtMobile: RaisePlaceholder!
    @IBOutlet weak var txtDOB: RaisePlaceholder!
    @IBOutlet weak var txtPassword: RaisePlaceholder!
    
    @IBOutlet var constraintVarticalSpace: [NSLayoutConstraint]!
    @IBOutlet var constraintVerticalY: NSLayoutConstraint!
    
    @IBOutlet weak var btnSignUp: GreenBGButton!
    @IBOutlet weak var btnSignInWithFb: UIButton!
    
    var isWithBackButton: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isWithBackButton {
            self.setNavigationButton(type: .BackGreen)
        } else {
            self.setLeftBArButtonNIl()
        }
        // Do any additional setup after loading the view.
        txtName.validateTextField(type: .Normal, minLength: 50, maxLength: 50, alignment: .left, placeHolder: "Name")
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
