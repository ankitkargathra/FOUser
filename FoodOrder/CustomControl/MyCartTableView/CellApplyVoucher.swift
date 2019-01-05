//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellApplyVoucher: UITableViewCell {

   
    @IBOutlet weak var lblSelectVoucher: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblSelectedVoucher: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblVoucherDetails: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var rightArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setCellApplyCode(applyed: Bool) {
        lblSelectVoucher.isHidden = applyed
        rightArrow.isHidden = applyed
        
        lblSelectedVoucher.isHidden = !applyed
        lblVoucherDetails.isHidden = !applyed
        btnClose.isHidden = !applyed
        
    }
    
}
