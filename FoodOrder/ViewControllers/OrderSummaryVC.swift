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
    
    @IBAction func btnTrackOrderPressed(_ sender: GreenBGButton) {
   
        self.dismiss(animated: true)
        
    }
}
