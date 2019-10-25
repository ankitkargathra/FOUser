//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellFoodCourtHeader: UITableViewCell {

    @IBOutlet weak var lblCourtName: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblCourtAddress: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblStoreCount: LabelAveNirNextProGrayMedium!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHeaderDetail(court: FoodCourtStore) {
        self.lblCourtName.text = checkNULL(str: court.name)
        self.lblCourtAddress.text = checkNULL(str: court.address)
        self.lblStoreCount.text = "\(checkNULL(str: court.total_stores)) STORES"
    }
    
}
