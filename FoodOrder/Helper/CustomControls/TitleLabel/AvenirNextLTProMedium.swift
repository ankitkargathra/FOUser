//
//  LableNeueBlack0023.swift
//  PopTasker
//
//  Created by Urja_Macbook on 30/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class AvenirNextLTProMedium: UILabel {

    @IBInspectable
    public var fontSize: CGFloat = 20.2 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: fontSize))
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.customBlackColor()
        self.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: fontSize))
    }
}

class LableNeueBoldBlack0023: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 21.0 {
        didSet {
            self.font = Font.setHelvaticaNeueLTPro(font: .NeueBold, size: getProportionalFont(size: fontSize))
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setBlack_0_0_23()
    }
}
