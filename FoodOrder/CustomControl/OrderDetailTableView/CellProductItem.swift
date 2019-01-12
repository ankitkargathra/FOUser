//
//  CellProductItem.swift
//  FoodOrder
//
//  Created by Rohan on 20/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellProductItem: UITableViewCell {

    @IBOutlet weak var lblProductQty: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblProductPrice: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblProductName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblProductTotal: LabelAveNirNextProBlackMeduim!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblProductQty.layer.borderColor = UIColor.colorGray().cgColor
        lblProductQty.layer.borderWidth = 0.5;
        lblProductQty.clipsToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellProductItem(PI:ItemOrderDetails){
    
        self.lblProductName.text = PI.itemName
        self.lblProductQty.text = PI.quantity
        self.lblProductPrice.text = PI.itemPrice.add$Tag()
        self.lblProductTotal.text = "\(Double(PI.quantity)! * Double(PI.itemPrice)!)".add$Tag()
    }
    
    func setDashlign() {
        self.addDashedBorder(points: [CGPoint(x: 17.3, y: self.frame.size.height-2),
                                      CGPoint(x: kPresentedViewWidth - 17.3, y: self.frame.size.height-2)])
    }
    
}


extension UIView {
    
    func addDashedBorder(points:[CGPoint]) {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.setColor(red: 203, green: 203, blue: 203).cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [2,3]
        
        let path = CGMutablePath()
        path.addLines(between: points)
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
