//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellApplyVaucher: BaseTableViewCell {


    @IBOutlet weak var lblBrandName: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblCouponDetail: LabelAveNirNextProGrayMedium!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func setCellDate() {
//        self.lblCouponOfferDetail.attributedText = UILabel.setLineSpacing(text: self.lblCouponOfferDetail.text!, spacing:5)
    }
}

