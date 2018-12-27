//
//  HelpAndSupportVC.swift
//  FoodOrder
//
//  Created by Rohan on 09/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class HelpAndSupportVC: BaseVC {

    @IBOutlet weak var txtTopic: RaisePlaceholder!
    @IBOutlet weak var txtDetails: UITextView!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Help & Support", subtitle: nil)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSendPress(_ sender: Any) {
        
        self.view.endEditing(true)
        UtilityClass.showHUD()
        if txtTopic.text?.trim().count ?? 0 > 0 {
            if txtDetails.text.trim().count > 0 {
                ApiController.shared.getHelpAndSupport(topic: txtTopic.text!, message: txtDetails.text!) { (success, message, response) in
                    UtilityClass.hideHUD()
                    TOAST.showToast(str: message)
                    self.popTo()
                }
            } else {
                Alert.showAlertWith(message: "Please enter Message.")
            }
        } else {
            Alert.showAlertWith(message: "Please enter Topic.")
        }
    }
}
