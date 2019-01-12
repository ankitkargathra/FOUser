//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellOrderStatus: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var imgLogo: RoundImageView!
    @IBOutlet weak var lblNameProduct: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblOrderTime: LabelAveNirNextProMediumWhite!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBoldWhite!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var btnViewDetails: UIButton!
    @IBOutlet weak var imgHot_pot: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellDataOrderPreparing(isPreparing: Bool, OS:DSCurrentOrder) {
        
        self.lblNameProduct.text = OS.restaurantName
        self.lblOrderTime.text = Date.convertDate(date: OS.orderDate)
        self.lblOrderNumber.text = OS.orderQueue
        if let img = OS.picture {
            self.imgLogo.kf.setImage(with: URL.init(string: img))
        }
        
        viewBg.backgroundColor = isPreparing ? UIColor.colorOrange() : UIColor.setOrderGreenColor()
        imgLogo.backgroundColor = isPreparing ? UIColor.customWhiteColor() : UIColor.setBlueFbColor()
        lblOrderStatus.text = isPreparing ? "Your order is being \nprepaired" : "Your order is ready \nto serve"
        
        if isPreparing {
            imgChef.isHidden = true
            imgHot_pot.isHidden = false
        } else {
            imgChef.isHidden = false
            imgHot_pot.isHidden = true
        }
        
    }
    
}
