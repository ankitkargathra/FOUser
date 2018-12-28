//
//  CellGrandTotal.swift
//  FoodOrder
//
//  Created by Rohan on 20/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

let kUpdateCartNotification = NSNotification.Name(rawValue: "setCartTotal")

class CellGrandTotalCart: UITableViewCell {

    
    @IBOutlet var viewLign: UIView!
    @IBOutlet weak var lblItemTotal: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblPercetnageTotal: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblGrandTotal: LabelAveNirNextProBlackDemi!
    
    @IBOutlet weak var lblVoucher: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblVoucherDiscount: LabelAveNirNextProBlackMeduim!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewLign.clipsToBounds = true
        viewLign.addDashedBorder(points: [CGPoint(x: 0, y: viewLign.frame.size.height / 2),
                                      CGPoint(x: self.frame.width, y: viewLign.frame.size.height / 2)])
        NotificationCenter.default.addObserver(self, selector: #selector(self.setCartTotal), name: kUpdateCartNotification, object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func setCartTotal() {
        
        var itemTotal = 0.0
        var percValue = 0.0
        var grandTotal = 0.0
        var voucherDiscount = 0.0
        for item in CartData.shared.items {
            itemTotal = itemTotal + (Double.init(item.addedInCartValue!) * Double.init(item.itemPrice!)!)
        }
        
        percValue = (itemTotal * 7.0) / 100
        grandTotal = itemTotal + percValue
        voucherDiscount = (grandTotal * Double.init(CartData.shared.voucherDiscount!)!) / 100
        let grandTotalWithDisc = grandTotal - voucherDiscount
        if voucherDiscount > 0 {
            lblVoucherDiscount.isHidden = false
            lblVoucher.isHidden = false
        } else {
            lblVoucherDiscount.isHidden = true
            lblVoucher.isHidden = true
        }
        CartData.shared.discount = "\(String.init(format: "%.2f", voucherDiscount))"
        CartData.shared.grand_total = "\(String.init(format: "%.2f", grandTotal))"
        CartData.shared.sub_total = "\(String.init(format: "%.2f", grandTotalWithDisc))"
        CartData.shared.tax = "\(String.init(format: "%.2f", percValue))"
        
        self.lblVoucherDiscount.text = "-\(String.init(format: "%.2f", voucherDiscount).add$Tag())"
        self.lblItemTotal.text = "\(String.init(format: "%.2f", itemTotal))".add$Tag()
        self.lblPercetnageTotal.text = "\(String.init(format: "%.2f", percValue))".add$Tag()
        self.lblGrandTotal.text = "\(String.init(format: "%.2f", grandTotalWithDisc))".add$Tag()
        
    }
}
