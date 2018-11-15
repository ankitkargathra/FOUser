//
//  MyOrderVC.swift
//  FoodOrder
//
//  Created by Rohan on 07/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class MyOrderVC: BaseVC {

    @IBOutlet var tableView: TableViewMyOrder!
    
    override func viewDidLoad() {
        
        self.addTitleView(title: "My Orders", subtitle: nil)
        super.viewDidLoad()
        self.setNavigationButton(type: .BackBlack)
        // Do any additional setup after loading the view.
        
        tableView.blockTableViewRateNowIndexPath = {
            let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
            cartVC.isRate = true
                    cartVC.modalPresentationStyle = .custom
//            self.navigationController?.pushViewController(cartVC, animated: true)
                    self.navigationController?.present(cartVC, animated: true, completion: nil)
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
