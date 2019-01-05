//
//  EditProfileVC.swift
//  FoodOrder
//
//  Created by Rohan on 16/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class EditProfileVC: BaseVC {
    
    @IBOutlet weak var btnProfileImg: SLButtonImagePicker!
    @IBOutlet var constraintWidth: NSLayoutConstraint!
    var profileData: ProfileData?
    
    @IBOutlet weak var txtName: RaisePlaceholder!
    @IBOutlet weak var txtEmail: RaisePlaceholder!
    @IBOutlet weak var txtMobile: RaisePlaceholder!
    @IBOutlet weak var txtDob: RaisePlaceholder!
    
    override func viewDidLoad() {
        setNavigationButton(type: .BackCart)
        addTitleView(title: "Edit Profile", subtitle: nil)
        
        super.viewDidLoad()
        
        setupTextfield()
        constraintWidth.constant = getProportionalWidth(width: 116)
        // Do any additional setup after loading the view.
        getProfileData()
    }
    
    func setupTextfield() {
        self.txtName.validateTextField(type: .Normal, minLength: 1, maxLength: 100, alignment: .left)
        self.txtEmail.validateTextField(type: .Email, minLength: 1, maxLength: 100, alignment: .left)
        txtEmail.isEnabled = false
        self.txtMobile.validateTextField(type: .Mobile, minLength: 1, maxLength: 10, alignment: .left)
        self.txtDob.validateTextField(type: .BDate, minLength: 1, maxLength: 30, alignment: .left)
    }
    
    func getProfileData() {
        UtilityClass.showHUD()
        ApiController.shared.getProfile { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                if response != nil {
                    self.profileData = ProfileData.init(fromDictionary: response!)
                    
                    if let pic = self.profileData?.picture, self.profileData!.picture.count > 0 {
                        self.btnProfileImg.kf.setBackgroundImage(with: URL.init(string: pic), for: UIControl.State.normal)
                    }
                    self.txtName.text = checkNULL(str: self.profileData?.fullname)
                    self.txtEmail.text = checkNULL(str: self.profileData?.email)
                    self.txtMobile.text = checkNULL(str: self.profileData?.phone)
                    self.txtDob.text = checkNULL(str: self.profileData?.dob)
                }
            }
        }
    }
    
    @IBAction func updateProfie() {
                
        self.profileData?.picture = nil
        self.profileData?.image = self.btnProfileImg.currentBackgroundImage!
        
        if txtName.validateTextFiled(validationMesage: RaisePlaceholder.ValidationMessage.EnterName) {
            self.profileData?.fullname = txtName.text!
            self.profileData?.phone = txtMobile.text!
            
            UtilityClass.showHUD()
            ApiController.shared.updateProfile(profile: self.profileData!) { (success, message, response) in
                UtilityClass.hideHUD()
                if success {
                    if response != nil {
                        LoggedinUser.shared.parseJsonDictionary(dict: response!)
                        NotificationCenter.default.post(name: kUpdateUserData, object: nil)
                    }
                }
                TOAST.showToast(str: message)
            }
//            if txtMobile.validateTextFiled(validationMesage: RaisePlaceholder.ValidationMessage.invalidMobile) {
//                
//                if txtDob.validateTextFiled(validationMesage: RaisePlaceholder.ValidationMessage.invalideMinBDate) {
//                    
//                    
//                }
//            }
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
    
    // MARK: - IBAction methods
    
    @IBAction func btnChangePasswordPress() {
        let chanhePVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "ChangePasswordVC")
        self.navigationController?.pushViewController(chanhePVC, animated: true)
    }

}
