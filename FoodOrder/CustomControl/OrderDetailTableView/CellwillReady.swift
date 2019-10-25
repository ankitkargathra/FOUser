//
//  CellwillReady.swift
//  FoodOrder
//
//  Created by Rohan on 20/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellwillReady: UITableViewCell {

    
    @IBOutlet var lblOrderNmber: LabelAveNirNextProBoldWhite!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellwillReady(RY:OrderDetails){
      self.lblOrderNmber.text = RY.orderQueue + " orders"
    }
}
