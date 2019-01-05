//
//  LableNeueLightGray119.swift
//  PopTasker
//
//  Created by Urja_Macbook on 30/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class LableNeueLightGray119: UILabel {

    @IBInspectable
    public var fontSize: CGFloat = 14.0 {
        didSet {
            self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: fontSize))
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setgray_119_119_119()
    }

}

class LableNeueLightGray136_129_139: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 14.0 {
        didSet {
            self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: fontSize))
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setGrayFont136_129_139()
    }
    
}
