//
//  VoucherDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 25/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class VoucherDetailVC: BaseVC {

    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Domino’s Pizza", subtitle: "26 Clementi Loop #01-55 Clementi Camp, 129817...")
        super.viewDidLoad()

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

}
