//
//  Button.swift
//  comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

class TOSButton: UIButton {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        let fontName = self.titleLabel!.font.fontName
        let fontSize = self.titleLabel!.font.pointSize
        
        if UIDevice().userInterfaceIdiom == .phone {
            
            let titleAttributes: [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue,
                NSAttributedStringKey.font : Font.setFont(name: fontName, size: getProportionalFont(size: fontSize))!,
                NSAttributedStringKey.foregroundColor : UIColor.white
            ]
            
            self.setAttributedTitle(NSAttributedString.init(string: self.titleLabel!.text!, attributes: titleAttributes), for: .normal)
            
        }
    }
}

extension UIButton{
    
//    open override func awakeFromNib() {
//        super.awakeFromNib()
//
//        let fontName = self.titleLabel?.font.fontName
//        var fontSize : CGFloat = (self.titleLabel?.font.pointSize)!
//
//        if UIDevice().userInterfaceIdiom == .phone {
//            switch UIScreen.main.nativeBounds.height {
//            case 1136: //iPhone 5 or 5S or 5C
//                fontSize -= 2
//            case 1334: //iPhone 6/6S/7/8
//                fontSize += 0
//            case 2208: //iPhone 6+/6S+/7+/8+
//                fontSize += 1
//            case 2436: //iPhone X
//                fontSize += 1
//            default:
//                print("unknown")
//            }
//            self.titleLabel?.font = Font.setFont(name: fontName!, size: fontSize)!
//        }
//    }
    
}

class BorderButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UtilityClass.setNavigationTitleColor().cgColor
        self.setTitleColor(UtilityClass.setNavigationTitleColor(), for: .normal)
    }
}

class ComonCustomButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.setButtonColor()
        self.titleLabel?.font = Font.getLatoFont(font: .Bold, size: 16)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.setColor(red: 70, green: 10, blue: 104).cgColor
    }
}

class RoundedButtonHeight: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}

/*
 Login Screen Yellow Button with animation (Gmail, Login with email)
 */

class LoginButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        UIView.animate(withDuration: 0.0,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.transform = CGAffineTransform.identity
                        }
        })
    }
}

/*
 SideMenu buttons
 */

class ButtonAveNirNextProMedium: UIButton {
    
    @IBInspectable
    public var fontSize: CGFloat = 18.8 {
        didSet {
            self.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        self.setTitleColor(UIColor.customBlackColor(), for: UIControlState.normal)
    }
}

class ButtonAveNirNextProMediumGray: UIButton {
    
    @IBInspectable
    public var fontSize: CGFloat = 15.7 {
        didSet {
            self.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    
    @IBInspectable
    public var fontColor: UIColor = UIColor.colorGray() {
        didSet {
            self.setTitleColor(fontColor, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        self.setTitleColor(fontColor, for: .normal)
    }
}

class ButtonAveNirNextProDemiBlack: UIButton {
    
    @IBInspectable
    public var fontSize: CGFloat = 17 {
        didSet {
            self.titleLabel?.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
        }
    }
    
    @IBInspectable
    public var fontColor: UIColor = UIColor.customBlackColor() {
        didSet {
            self.setTitleColor(fontColor, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
        self.setTitleColor(fontColor, for: .normal)
    }
}


