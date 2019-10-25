//
//  CellGrandTotal.swift
//  FoodOrder
//
//  Created by Rohan on 20/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellGrandTotal: UITableViewCell {

    
    @IBOutlet var viewLign: UIView!
    @IBOutlet weak var lblItemTotal: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblTax: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblSubTotal: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblPaymentMethod: LabelAveNirNextProBlackMeduim!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewLign.clipsToBounds = true
        viewLign.addDashedBorder(points: [CGPoint(x: 0, y: viewLign.frame.size.height / 2),
                                      CGPoint(x: self.frame.width, y: viewLign.frame.size.height / 2)])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellGrandTotal(GT:OrderDetails){
       
        self.lblItemTotal.text = GT.subTotal.add$Tag()
        self.lblTax.text = GT.tax.add$Tag()
        self.lblSubTotal.text = GT.grandTotal.add$Tag()
        self.lblPaymentMethod.text = GT.paymentMethod
    }
    
}
