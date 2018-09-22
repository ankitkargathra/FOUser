//
//  SLTextField.swift
//  Truper
//
//  Created by Rohan on 07/08/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField, UITextFieldDelegate {
    
    // TestField Types
    enum TextFieldType {
        case Email
        case Password
        case Mobile
        case BDate
    }
    
    // TestField Validation messages
    enum ValidationMessage: String  {
        case EmptyEmailID = "Please enter email id."
        case invalidEmail = "Email id not valid."
        case invalidPassLength = "Please enter password with minimum"
        case invalidMobile = "Please enter 10 digit mobile no."
        case invalideMinBDate = "Age required min 10"
        case blank = ""
    }
    
    var textMaxLength: Int! = 0
    var textMinLength: Int! = 0
    
    var validationStrMessage: String = ""
    var textType: TextFieldType!
    
    var datePicker: UIDatePicker {
        let dtPicker = UIDatePicker()
        dtPicker.datePickerMode = .date
        return dtPicker
    }
    var datePickerFormate: String! = "dd/MM/yyyy"
    
    func validateTextField(type: TextFieldType, minLength: Int, maxLength: Int, alignment: NSTextAlignment, placeHolder: String = "") {
        
        textType = type
        textMaxLength = maxLength
        textMinLength = minLength
        self.placeholder = placeHolder
        self.delegate = self
        self.textAlignment = alignment
        switch textType! {
        case .Email:
            self.keyboardType = .emailAddress
            break
        case .Password:
            self.isSecureTextEntry = true
            break
        case .Mobile:
            self.keyboardType = .numberPad
            break
        case .BDate:
            self.inputView = datePicker
            datePicker.addTarget(self, action: #selector(self.setDateToTextField), for: .valueChanged)
            break
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        
        switch textType! {
        case .Email:
            return newLength <= textMaxLength
        case .Password:
            return newLength <= textMaxLength
        case .Mobile:
            return newLength <= textMaxLength
        case .BDate:
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textValue = textField.text!
        switch textType! {
        case .Email:
            if !self.isValidEmail(testStr: textValue) {
            }
            break
        case .Password:
            if textValue.count < textMinLength {
            }
            break
        case .Mobile:
            if textValue.count < textMinLength {
            }
            break
        case .BDate:
            self.setDateToTextField()
            return
        }
    }
    
    func validateTextFiled(validationMesage: ValidationMessage) -> Bool {
        let textValue = self.text!
        switch textType! {
        case .Email:
            
            if textValue.trim().count == 0 {
                validationStrMessage = ValidationMessage.EmptyEmailID.rawValue
                showAlert()
                return false
            }
            
            if !self.isValidEmail(testStr: textValue) {
                validationStrMessage = validationMesage.rawValue
                showAlert()
                return false
            } else {
                return true
            }
        case .Password:
            if textValue.count < textMinLength {
                validationStrMessage = validationMesage.rawValue + " \(textMinLength!) digits."
                showAlert()
                return false
            } else {
                return true
            }
        case .Mobile:
            if textValue.count < textMinLength {
                validationStrMessage = validationMesage.rawValue
                showAlert()
                return false
            } else {
                return true
            }
        case .BDate:
            if textValue.count == 0 {
                validationStrMessage = "please enter B'Date"
                showAlert()
                return false
            } else {
                
            }
            return true
        }
    }
    
    //MARK: Email Varification
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlert() {
        
        let alertVc = UIAlertController.init(title:kAppName, message: validationStrMessage, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
        }
        alertVc.addAction(okAction)
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.present(alertVc, animated: true, completion: nil)
    }
    
    //MARK: Set date from datePicker
    
    @objc func setDateToTextField() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = datePickerFormate
        self.text = dateFormatter.string(from: datePicker.date)
    }
    
}
