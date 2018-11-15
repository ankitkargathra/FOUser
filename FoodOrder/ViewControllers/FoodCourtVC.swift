//
//  FoodCourtVC.swift
//  FoodOrder
//
//  Created by Rohan on 21/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class FoodCourtVC: BaseVC {

    @IBOutlet var tblFoodCourtList: FoodCourtTableView!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackCart)
        super.viewDidLoad()

        tblFoodCourtList.blockTableViewDidSelectAtIndexPath = { (indexpath) in
            let detailVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "FoodCourtDetailVC") as! FoodCourtDetailVC
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
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
