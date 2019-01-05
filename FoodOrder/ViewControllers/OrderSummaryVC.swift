//
//  OrderSummaryVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class OrderSummaryVC: BaseVC {

    @IBOutlet weak var lblOrderNumber: LabelAveNirNextProDemiWhite!
    @IBOutlet weak var lblOrderQueue: LabelAveNirNextProBoldWhite!
    
    var orderNumber: String? = "0"
    var queueNumber: String? = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblOrderNumber.text = orderNumber
        lblOrderQueue.text = "\(queueNumber!) \(queueNumber! == "1" ? "order" : "orders")"
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
