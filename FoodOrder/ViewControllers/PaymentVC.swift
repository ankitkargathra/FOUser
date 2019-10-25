//
//  PaymentVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class PaymentVC: BaseVC {

    @IBOutlet var tblPayment: TableViewPayment!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Payment", subtitle: "\(CartData.shared.items.count) Items, To pay $ \(String.init(format: "%.2f", Double.init(CartData.shared.sub_total!)!))")
        super.viewDidLoad()

        tblPayment.blockTableViewDidSelectAtIndexPath = { (indexpath, cell) in
            if cell == PaymentcellType.CellPayment {
                if indexpath.row == 0 {
                    let cardVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "CardDetailVC") as! CardDetailVC
                    self.navigationController?.pushViewController(cardVC, animated: true)
                } else {
                    if CartData.shared.order_type == "1"{
                        if CartData.shared.table_number == nil || CartData.shared.table_number?.trim().count == 0 {
                            Alert.showAlertWith(message: "Please enter table number.")
                            return
                        }
                        CartData.shared.table_number = CartData.shared.table_number!.trim()
                    }
                    CartData.shared.payment_method = "Cash on Delivery"
                    let alertController = UIAlertController.init(title: kAppName, message: "Are you sure you want to confirm your order.", preferredStyle: .alert)
                    let cancelAction = UIAlertAction.init(title: "NO", style: UIAlertActionStyle.cancel, handler: nil)
                    let okAction = UIAlertAction.init(title: "YES", style: UIAlertActionStyle.default, handler: { (action) in
                        
                        UtilityClass.showHUD()
                        ApiController.shared.sendOrder(cart: CartData.shared.toJsonDict(), completionHandler: { (success, message, response) in
                            UtilityClass.hideHUD()
                            if success == true {
                                if response != nil {
                                    let orderPlacedVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
                                    if let order_number = response!["order_number"] as? String{
                                        orderPlacedVC.orderNumber = order_number
                                    }
                                    
                                    if let order_queue = response!["order_queue"] {
                                        orderPlacedVC.queueNumber = "\(order_queue)"
                                    }
                                    CartData.shared.removeCart()
                                    self.navigationController?.present(orderPlacedVC, animated: true, completion: nil)
                                }
                            }
                            
                        })
                        
                    })
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
