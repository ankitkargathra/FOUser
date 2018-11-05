//
//  CellMainHeader.swift
//  FoodOrder
//
//  Created by Rohan on 30/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellMainHeader: UICollectionViewCell {

    @IBOutlet var brandView: UIView!
    @IBOutlet var dotedLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        brandView.clipsToBounds = false
        brandView.layer.shadowColor = UIColor.black.cgColor
        brandView.layer.shadowOpacity = 0.7
        brandView.layer.shadowOffset = CGSize.zero
        brandView.layer.shadowRadius = 8.6
        //brandView.layer.shadowPath = UIBezierPath(roundedRect: brandView.bounds, cornerRadius: 8.6).cgPath
        brandView.layer.cornerRadius = 8.6
        dotedLine.addDashedBorder(points: [CGPoint(x: 0, y: dotedLine.frame.size.height / 2),
                                           CGPoint(x: self.frame.width, y: dotedLine.frame.size.height / 2)])
        dotedLine.clipsToBounds = true
    }
    
}
