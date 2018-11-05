//
//  CellGrandTotal.swift
//  FoodOrder
//
//  Created by Rohan on 20/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellGrandTotalCart: UITableViewCell {

    
    @IBOutlet var viewLign: UIView!
    
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
    
}
