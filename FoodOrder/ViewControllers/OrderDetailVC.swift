//
//  OrderDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 19/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class OrderDetailVC: BaseVC {

    @IBOutlet weak var tableView: TableViewOrderDetail!
    
    var orderId:String!
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
//        self.addTitleView(title: "Order #", subtitle: "")
        super.viewDidLoad()
        self.getOrderDetails()
        // Do any additional setup after loading the view.
    }
 
    func getOrderDetails(){
        
        UtilityClass.showHUD()
        ApiController.shared.getOrderDetails(orderId: orderId, completionHandler: { (success, message, response) in
            UtilityClass.hideHUD()
            if success == true {
                if response != nil {
                  self.tableView.arrOrderDetails.removeAll()
                  let orderDetails = OrderDetails.init(fromDictionary: response!)
                  self.tableView.arrOrderDetails.append(orderDetails)
                  self.getsectionData()
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func getsectionData(){
        var arr:[OrderDetailCellType] = []
        for _ in self.tableView.arrOrderDetails[0].items{
            arr.append(OrderDetailCellType.Product)
        }
        arr.append(.Total)
        self.tableView.sectionArray.append(arr)
        self.addTitleView(title: "Order #\(String(describing: self.tableView.arrOrderDetails[0].orderNumber!))", subtitle: "\(String(describing: Date.convertDate(date: self.tableView.arrOrderDetails[0].orderDate)))")
    }
    
//    @IBAction func unwindBackToOrderDetailWithSegue(segue: UIStoryboardSegue) {
//        let vc = segue.source as! OrderSummaryVC
//        orderId = vc.orderNumber
//    }
}
