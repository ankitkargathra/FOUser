//
//  NeueLightButton.swift
//  PopTasker
//
//  Created by Rohan on 20/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class GreenBGButton: UIButton {

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
        self.setRadius()
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel!.font = Font.setAveNirNextPro(font: .Demi, size: getProportionalFont(size: 20.2))
//        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        self.backgroundColor = UIColor.appGreenColor()
        self.setRadius(radius: 5.7)
    }

}

class ButtonAvenirNextLTProMedium: UIButton {
    
    @IBInspectable
    public var fontSize: CGFloat = 15.7 {
        didSet {
            self.titleLabel!.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: fontSize))
        }
    }
    override func draw(_ rect: CGRect) {
        self.setFont()
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setFont()
    }
    
    func setFont() {
        self.setCornerRadius()
        self.setTitleColor(UIColor.customBlackColor(), for: .normal)
        self.titleLabel!.font = Font.setAveNirNextPro(font: .Medium, size: getProportionalFont(size: fontSize))
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func setBackgroundColor(type: ColorType = ColorType.signInPurple) {
        self.backgroundColor = type.color
    }
}

class NeueLightButtonGray: UIButton {
    
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
        self.setCornerRadius()
        self.setTitleColor(UIColor.customGrayColor(), for: .normal)
        self.titleLabel!.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: 16))
        self.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0)
    }
    
    func setBackgroundColor(type: ColorType = ColorType.signInPurple) {
        self.backgroundColor = type.color
    }
}

class NeueComonButtonwithGradiantImg: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        self.setFont()
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setFont()
     self.setBackgroundImage(GradientImage.gradientTheamBackgroundFrame(view: self), for: .normal)

    }
    
    func setFont() {
        self.setCornerRadius()
        self.setTitleColor(UIColor.customWhiteColor(), for: .normal)
        self.titleLabel!.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: 18.7))
        self.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0)
    }
    
    func setBackgroundColor(type: ColorType = ColorType.signInPurple) {
        //self.backgroundColor = type.color
    }
}
