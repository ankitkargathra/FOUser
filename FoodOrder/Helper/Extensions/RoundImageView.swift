//
//  RoundImageView.swift
//  FoodOrder
//
//  Created by Rohan on 13/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.setRadius(radius: self.frame.size.width / 2)
        }
        self.backgroundColor = UIColor.appGreenColor()
    }

}
