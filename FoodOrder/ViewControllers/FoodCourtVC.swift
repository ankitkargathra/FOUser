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
    var foodCourt: FoodCourt!
    var foodCourtId:String!
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackCart)
        super.viewDidLoad()

        tblFoodCourtList.blockTableViewDidSelectAtIndexPath = { (indexpath) in
            let detailVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "FoodCourtDetailVC") as! FoodCourtDetailVC
            detailVC.foodCourt = self.tblFoodCourtList.court.restaurants[indexpath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        // Do any additional setup after loading the view.
        self.getCourtDetail()
    }
    
    func getCourtDetail() {

        UtilityClass.showHUD()
        ApiController.shared.getFoodCourtStores(food_court_id: foodCourtId) { (success, message, response) in
            UtilityClass.hideHUD()
            if success {
                if response != nil {
                    let court = FoodCourtStore()
                    court.populateJson(dict: response!)
                    self.tblFoodCourtList.court = court
                    self.tblFoodCourtList.reloadData()
                }
            }
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
