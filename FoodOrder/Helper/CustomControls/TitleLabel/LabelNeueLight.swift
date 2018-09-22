//
//  TitleLblTextField.swift
//  PopTasker
//
//  Created by Rohan on 20/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class LabelNeueLight: UILabel {

    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: fontSize))
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.customGrayColor() {
        didSet {
            self.textColor = color
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = color
    }
    
}

class LabelNeueLightBlack: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: fontSize))
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.black {
        didSet {
            self.textColor = color
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = color
    }
    
}
