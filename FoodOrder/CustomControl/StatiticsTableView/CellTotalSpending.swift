//
//  CellTotalSpending.swift
//  FoodOrder
//
//  Created by Rohan on 05/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellTotalSpending: BaseTableViewCell {

    @IBOutlet weak var lblRestautantName: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblAmount: LabelAveNirNextProDemiWhite!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
 
    func cellTotalSpendingData(RW:RestaurentWise){
       lblRestautantName.text = RW.restaurantName
       lblAmount.text = String(RW.orderAmount!).add$Tag()
    }
    
}
