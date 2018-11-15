//
//  CellTotalSpending.swift
//  FoodOrder
//
//  Created by Rohan on 05/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellFoodSize: UITableViewCell {

    @IBOutlet var lblSize: LabelAveNirNextProBlackMeduim!
    @IBOutlet var lblPrice: LabelAveNirNextProGrayMedium!
    @IBOutlet var imgSelection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
