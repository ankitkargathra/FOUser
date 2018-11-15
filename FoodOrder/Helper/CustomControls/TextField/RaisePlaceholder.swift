//
//  RaisePlaceholder.swift
//  RaisePlaceholder
//
//  Created by Lee Jiho on 2017. 6. 11..
//  Copyright © 2017년 Lee Jiho. All rights reserved.
//

import UIKit

class RaisePlaceholder:  UITextField, UITextFieldDelegate {

    @IBInspectable public var animationDuration: Double = 0.5
    @IBInspectable public var subjectColor: UIColor = UIColor.setGreenColor()
    @IBInspectable public var underLineSelectedColor: UIColor = UIColor.setGreenColor()
    @IBInspectable public var underLineUnSelectedColor: UIColor = UIColor.setColor(red: 196, green: 201, blue: 206)
    
    let placeholderLabelFontSize: CGFloat = 12.0
    var placeholderLabel: UILabel?
    var titlePlaceholder: String?
    
    var underLineView = UIView()
    var label = UILabel()
    
    // TestField Types
    enum TextFieldType {
        case Normal
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
        case EnterName = "Plese enter your name."
        case blank = ""
    }
    
    var textMaxLength: Int! = 0
    var textMinLength: Int! = 0
    
    var validationStrMessage: String = ""
    var textType: TextFieldType!
    
    
    var datePickerFormate: String! = "dd/MM/yyyy"
    
    override public func draw(_ rect: CGRect) {
        if placeholderLabel == nil {
            drawUnderLine()
            createPlaceholderLabel()
            self.clipsToBounds = false
            self.borderStyle = .none
        }
        self.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: 15.7))
    }
    
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
            let btnShowPassword = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
            btnShowPassword.imageEdgeInsets = UIEdgeInsetsMake(8, 5, 8, 5)
            btnShowPassword.setImage(UIImage.init(named: "eye_on"), for: .normal)
            btnShowPassword.setImage(UIImage.init(named: "eye_off"), for: .selected)
            self.rightViewMode = .always
            self.rightView = btnShowPassword
            btnShowPassword.addTarget(self, action: #selector(self.btnShowPasswordPress(button:)), for: UIControlEvents.touchUpInside)
            break
        case .Mobile:
            self.keyboardType = .numberPad
            break
        case .BDate:
            var datePicker: UIDatePicker {
                let dtPicker = UIDatePicker()
                dtPicker.datePickerMode = .date
                dtPicker.maximumDate = Date()
                dtPicker.addTarget(self, action: #selector(self.setDateToTextField), for: UIControlEvents.valueChanged)
                return dtPicker
            }
            self.inputView = datePicker
            
            break
        case .Normal:
            self.keyboardType = .default
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
        case .Normal:
            return newLength <= textMaxLength
        }
    }
    
    fileprivate func drawUnderLine() {
        
        underLineView = UIView(frame: CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1))
        underLineView.backgroundColor = underLineUnSelectedColor
        
        self.addSubview(underLineView)
        
    }
    
    fileprivate func createPlaceholderLabel() {
        
        if !self.label.isDescendant(of: self) {
            let origin = self.frame.origin
            label = UILabel(frame: CGRect(x: origin.x, y: origin.y, width: self.frame.size.width, height: 15.0))
            label.center = self.center
            label.text = ""
            label.font = Font.setAveNirNextPro(font: .Medium, size: self.placeholderLabelFontSize)
            label.textColor = subjectColor
            
            if let superView = self.superview {
                
                superView.insertSubview(label, belowSubview: self)
            }
            self.placeholderLabel = label
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if let placeholderLabel = self.placeholderLabel, self.text == "" {
            
            if placeholderLabel.alpha == 0 {
                placeholderLabel.alpha = 1
            }
            
            if self.placeholder == "" {
                self.titlePlaceholder = placeholderLabel.text
            } else {
                self.titlePlaceholder = self.placeholder
            }
            
            self.placeholder = ""
            
            let frame = placeholderLabel.frame
            UIView.animate(withDuration: animationDuration, animations: {
                placeholderLabel.text = self.titlePlaceholder
                placeholderLabel.font = Font.setAveNirNextPro(font: .Medium, size: self.placeholderLabelFontSize)
                placeholderLabel.textColor = self.subjectColor
                placeholderLabel.frame.origin.y = frame.origin.y - placeholderLabel.frame.size.height - (self.frame.size.height / 2 - frame.size.height / 2)
            }, completion: { (isComplete) in
                
            })
        }
        underLineView.backgroundColor = underLineSelectedColor
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let placeholderLabel = self.placeholderLabel, self.text == "" {
            let frame = placeholderLabel.frame
            UIView.animate(withDuration: animationDuration, animations: {
                
                placeholderLabel.alpha = 1
                placeholderLabel.textColor = UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
                    //UIColor(colorLiteralRed: 0, green: 0, blue: 0.0980392, alpha: 0.22)
                
                placeholderLabel.frame.origin.y = frame.origin.y + placeholderLabel.frame.size.height + (self.frame.size.height / 2 - frame.size.height / 2)
                if let pointSize = self.font?.pointSize {
                    placeholderLabel.font = Font.setAveNirNextPro(font: .Medium, size: pointSize)
                }
                
            }, completion: { (isComplete) in
                self.placeholder = self.titlePlaceholder
                placeholderLabel.alpha = 0
            })
            underLineView.backgroundColor = underLineUnSelectedColor
        } else {
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
//                self.setDateToTextField()
                return
            case .Normal:
                if textValue.count < textMinLength {
                }
            }
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
        case .Normal:
            if textValue.count < textMinLength {
                validationStrMessage = validationMesage.rawValue
                showAlert()
                return false
            } else {
                return true
            }
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
    
    @objc func setDateToTextField(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = datePickerFormate
        self.text = dateFormatter.string(from: picker.date)
    }
    
    @objc func btnShowPasswordPress(button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        self.isSecureTextEntry = !button.isSelected
    }
}
