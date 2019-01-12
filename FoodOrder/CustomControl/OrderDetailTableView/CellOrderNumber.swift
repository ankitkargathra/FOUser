//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellOrderNumber: UITableViewCell {
    
    @IBOutlet weak var lblTableNo: UILabel!
    @IBOutlet weak var orderStatus: LabelAveNirNextProBlackGreen!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellOrderNumber(ON:OrderDetails){
     self.lblTableNo.text = ON.orderQueue
     self.orderStatus.text = ON.orderStatus
        if ON.orderStatus == "Order In Kitchen" || ON.orderStatus == "Order Ready to Serve"{
            self.orderStatus.textColor = ON.orderStatus == "Order In Kitchen" ? UIColor.colorOrange() : UIColor.appGreenColor()
        }else{
            self.orderStatus.textColor = ON.orderStatus == "Order Delivered" ? UIColor.appGreenColor() : UIColor.colorRed()
        }
    }
    
}
