//
//  SideMenuVC.swift
//  FoodOrder
//
//  Created by Rohan on 03/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class SideMenuVC: BaseVC {
    
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnImg: UIButton!
    
    
    enum SideMenuType: Int{
        case myOrder,notification,vouchers,termsOfUse,privacyPolicy,FAQa,helpAndSupport,logout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setEditButton()
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
            let myOrderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "VauchersVC") as! VauchersVC
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
}
