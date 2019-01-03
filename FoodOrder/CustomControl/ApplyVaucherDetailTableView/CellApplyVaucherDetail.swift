//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellApplyVaucherDetail: BaseTableViewCell {


    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var lblCouponOfferDetail: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var viewDashLignBorder: UIView!
    @IBOutlet weak var viewLogo: UIView!
    @IBOutlet weak var lblPerc: UILabel!
    @IBOutlet weak var lblPercOff: LabelAveNirNextProDemiWhite!
    @IBOutlet weak var lblPerOff2: LabelAveNirNextProDemiOrange!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.heightConstraint.constant = getProportionalWidth(width: 203)
//        self.widthConstraint.constant = getProportionalWidth(width: 203)
        
        DispatchQueue.main.async {
            self.viewDashLignBorder.drawDashLineBorder()
            self.viewCenter.setRadius(radius: self.viewCenter.frame.size.width / 2)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func setCellDate(v: Voucher) {
        self.lblCouponOfferDetail.text = checkNULL(str: v.descriptionField)
        
        
        self.lblPerc.text = "\(checkNULL(str: v.discount!)) %"
        self.lblPercOff.text = "\(checkNULL(str: v.discount!)) OFF"
        self.lblPerOff2.text = "\(checkNULL(str: v.discount!)) OFF"
        
//        self.lblCouponOfferDetail.attributedText = UILabel.setLineSpacing(text: self.lblCouponOfferDetail.text!, spacing:5)
    }
}

