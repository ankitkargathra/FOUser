//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import Kingfisher

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
    
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var lblPerOff: LabelAveNirNextProDemiWhite!
    @IBOutlet weak var lblPerOff2: LabelAveNirNextProDemiOrange!
    @IBOutlet weak var imgLogo: UIImageView!
    
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
    
    
    func setCellDate(v: Voucher) {
        self.lblCouponOfferDetail.text = checkNULL(str: v.descriptionField)
        self.lblBrandName.text = checkNULL(str: v.restaurantName)
        self.lblCouponDetail.text = checkNULL(str: v.restaurantAddress)
        if let imgUrl = v.picture {
            self.imgLogo.kf.setImage(with: URL.init(string: imgUrl))
        }
        self.lblPercentage.text = "\(checkNULL(str: v.discount!)) %"
        self.lblPerOff.text = "\(checkNULL(str: v.discount!)) OFF"
        self.lblPerOff2.text = "\(checkNULL(str: v.discount!)) OFF"
        self.lblExpireDate.text = Date.convertDateToValidDate(date: checkNULL(str: v.endDate))
        
        
//        self.lblCouponOfferDetail.attributedText = UILabel.setLineSpacing(text: self.lblCouponOfferDetail.text!, spacing:5)
    }
}

