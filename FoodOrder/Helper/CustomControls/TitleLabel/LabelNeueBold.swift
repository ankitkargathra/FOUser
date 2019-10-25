//
//  TitleLblTextField.swift
//  PopTasker
//
//  Created by Rohan on 20/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class LabelNeueBold: UILabel {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.setFont()
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setFont()
    }
    
    func setFont() {
        self.textColor = UIColor.customBlackColor()
        self.font = Font.setHelvaticaNeueLTPro(font: .NeueBold, size: getProportionalFont(size: 17))
    }
    

}
class LabelNeueBoldCustomBlack: UILabel {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.setFont()
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setFont()
    }
    
    func setFont() {
        self.textColor = UIColor.setBlack_0_0_23()
        self.font = Font.setHelvaticaNeueLTPro(font: .NeueBold, size: getProportionalFont(size: 17))
    }
    
    
}
