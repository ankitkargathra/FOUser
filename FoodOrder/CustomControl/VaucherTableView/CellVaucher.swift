//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellVaucher: BaseTableViewCell {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewCenter: UIView!
    
    @IBOutlet weak var lblBrandName: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblCouponDetail: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblCouponOfferDetail: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblExpireDate: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var viewDashLignBorder: UIView!
    @IBOutlet weak var viewLogo: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.heightConstraint.constant = getProportionalWidth(width: 119.9)
        self.widthConstraint.constant = heightConstraint.constant
        
        DispatchQueue.main.async {
            self.viewDashLignBorder.drawDashLineBorder()
            self.viewCenter.setRadius(radius: self.viewCenter.frame.size.width / 2)
            self.viewLogo.setRadius(radius: self.viewLogo.frame.size.width / 2)
        }
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

