//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellApplyVaucherOffers: UITableViewCell {


    
    @IBOutlet weak var lblCouponOfferDetail: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var imgViewDot: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        imgViewDot.image = imgViewDot.image?.withRenderingMode(.alwaysTemplate)
        imgViewDot.tintColor = UIColor.colorGray()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func setCellDate() {
//        self.lblCouponOfferDetail.attributedText = UILabel.setLineSpacing(text: self.lblCouponOfferDetail.text!, spacing:5)
    }
}

