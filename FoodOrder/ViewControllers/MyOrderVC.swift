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
        
        tableView.blockTableViewDidSelectAtIndexPath = { (indexpath, section) in

            let orderVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
            if section == 0{
              orderVC.orderId = self.tableView.arrCurrentOrder[indexpath.row].orderId
            }else{
              orderVC.orderId = self.tableView.arrPastOrder[indexpath.row].orderId
            }
            self.navigationController?.pushViewController(orderVC, animated: true)
        }
        tableView.blockTableViewRateNowIndexPath = { (sender, section) in
            let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "RatePopupVC") as! RatePopupVC
            cartVC.isRate = true
            cartVC.isUpdate = true
            cartVC.isFromList = true
            if section == 0{
                cartVC.orderId = self.tableView.arrCurrentOrder[sender].orderId
                cartVC.restautantId = self.tableView.arrCurrentOrder[sender].restaurentId
                cartVC.restautantName = self.tableView.arrCurrentOrder[sender].restaurantName
                cartVC.restaurantAddress = self.tableView.arrCurrentOrder[sender].restaurentAddress
                cartVC.picture = self.tableView.arrCurrentOrder[sender].picture
            }else{
                cartVC.orderId = self.tableView.arrPastOrder[sender].orderId
                cartVC.restautantId = self.tableView.arrPastOrder[sender].restaurentId
                cartVC.restautantName = self.tableView.arrPastOrder[sender].restaurantName
                cartVC.restaurantAddress = self.tableView.arrPastOrder[sender].restaurentAddress
                cartVC.picture = self.tableView.arrPastOrder[sender].picture
            }
            cartVC.delegatemyOrder = self
            cartVC.modalPresentationStyle = .custom
            self.navigationController?.present(cartVC, animated: true, completion: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                    if myorder.currentOrders.count == 0 && myorder.pastOrder.count == 0{
                        self.tableView.isHidden = true
                        return
                    }
                    for obj in myorder.currentOrders{
                        self.tableView.arrCurrentOrder.append(obj)
                    }
                    for obj in myorder.pastOrder{
                        self.tableView.arrPastOrder.append(obj)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                self.tableView.isHidden = true
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
