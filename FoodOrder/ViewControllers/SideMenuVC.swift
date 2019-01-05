//
//  SideMenuVC.swift
//  FoodOrder
//
//  Created by Rohan on 03/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import Kingfisher

let kUpdateUserData = NSNotification.Name(rawValue: "setUserData")

class SideMenuVC: BaseVC {
    
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnImg: UIButton!
    
    @IBOutlet weak var lblName: LabelAveNirNextProBlackDemi!
    
    enum SideMenuType: Int{
        case myOrder,notification,vouchers,termsOfUse,privacyPolicy,FAQa,helpAndSupport,logout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setEditButton()
        setUserData()
        NotificationCenter.default.addObserver(self, selector: #selector(self.setUserData), name: kUpdateUserData, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func setUserData() {
        lblName.text = checkNULL(str: LoggedinUser.shared.fullname)
        if checkNULL(str: LoggedinUser.shared.picture) != "" {
            btnImg.kf.setBackgroundImage(with: URL.init(string: LoggedinUser.shared.picture!), for: UIControl.State.normal)
            btnImg.setTitle("", for: UIControlState.normal)
        } else {
            if checkNULL(str: lblName.text).count > 0 {
                btnImg.setTitle("\(String.init(Array(lblName.text!)[0]))".uppercased(), for: UIControlState.normal)
            } else {
                btnImg.setTitle("", for: UIControlState.normal)
            }
        }
    }
    
    //MARK: Edit Button
    
    func setEditButton() {
        
        btnEdit.setTitle("Edit", for: .normal)
        btnEdit.setBorder(width: 0.6)
        btnEdit.setRadius(radius: 4.3)
        let color = UIColor.colorLightSky()
        btnEdit.setTitleColor(color, for:.normal)
        btnEdit.layer.borderColor = color.cgColor
        btnImg.backgroundColor = UIColor.appGreenColor()
    }
    
    
    @IBAction func menuButtonPress(button: UIButton) {
        
        let type = SideMenuType.init(rawValue: button.tag)!
        
        switch type {
        case .myOrder:
            let myOrderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "MyOrderVC") as! MyOrderVC
            SJSwiftSideMenuController.pushViewController(myOrderVC, animated: true)
            break
        case .notification:
            let myOrderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
            SJSwiftSideMenuController.pushViewController(myOrderVC, animated: true)
            break
        case .vouchers:
            let myOrderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "VauchersVC") as! VouchersVC
            SJSwiftSideMenuController.pushViewController(myOrderVC, animated: true)
            break
        case .termsOfUse:
            break
        case .privacyPolicy:
            break
        case .FAQa:
            break
        case .helpAndSupport:
            let helpSupport = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "HelpAndSupportVC") as! HelpAndSupportVC
            SJSwiftSideMenuController.pushViewController(helpSupport, animated: true)
            break
        case .logout:
            Alert.logoutAlert(message: "Are you sure to logout.?")
            break
        }
        SJSwiftSideMenuController.hideLeftMenu()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: IBActions
    
    @IBAction func btnEditProfilePree() {
        let helpSupport = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        SJSwiftSideMenuController.pushViewController(helpSupport, animated: true)
        SJSwiftSideMenuController.hideLeftMenu()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setUserData()
    }
}
