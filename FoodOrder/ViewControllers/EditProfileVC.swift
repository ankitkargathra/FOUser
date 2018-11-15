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
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackCart)
        self.addTitleView(title: "Edit Profile", subtitle: nil)
        super.viewDidLoad()
        constraintWidth.constant = getProportionalWidth(width: 116)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnChangePasswordPress() {
        let chanhePVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "ChangePasswordVC")
        self.navigationController?.pushViewController(chanhePVC, animated: true)
    }

}
