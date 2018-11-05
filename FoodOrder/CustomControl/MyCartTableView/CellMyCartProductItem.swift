//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellMyCartProductItem: UITableViewCell {

   
    @IBOutlet weak var viewRated: UIView!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBlackGreen!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData() {
    
    }
    
}
