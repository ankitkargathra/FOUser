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
        
        tableView.blockTableViewDidSelectAtIndexPath = { (indexpath) in

            let orderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
            orderVC.orderId = self.tableView.arrCurrentOrder[indexpath.row].orderId
            self.navigationController?.pushViewController(orderVC, animated: true)
        }
//                    let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
//                    cartVC.isRate = true
//                    cartVC.modalPresentationStyle = .custom
//                    self.navigationController?.pushViewController(cartVC, animated: true)
//                    self.navigationController?.present(cartVC, animated: true, completion: nil)
        self.getmyorderData()
    }
    
    func getmyorderData() {
        
        UtilityClass.showHUD()
        ApiController.shared.getmyOrders { (success, message, response) in
            UtilityClass.hideHUD()
            if success == true {
                if response != nil {
                    self.tableView.arrCurrentOrder.removeAll()
                    self.tableView.arrPastOrder.removeAll()
                    let myorder = MyOrder.init(fromDictionary: response!)
                    for obj in myorder.currentOrders{
                        self.tableView.arrCurrentOrder.append(obj)
                    }
                    for obj in myorder.pastOrder{
                        self.tableView.arrPastOrder.append(obj)
                    }
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
