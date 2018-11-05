//
//  Label.swift
//  comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    open override func awakeFromNib() {
        super.awakeFromNib()

//        let fontName = self.font.fontName
//        var fontSize = self.font.pointSize
//
//        if UIDevice().userInterfaceIdiom == .phone {
//            switch UIScreen.main.nativeBounds.height {
//            case 1136: //iPhone 5 or 5S or 5C
//                fontSize -= 2
//            case 1334: //iPhone 6/6S/7/8
//                fontSize -= 1
//            case 2208: //iPhone 6+/6S+/7+/8+
//                fontSize += 0
//            case 2436: //iPhone X
//                fontSize += 1
//            default:
//                print("unknown")
//            }
//            self.font = Font.setFont(name: fontName, size: fontSize)!
//        }
    }

}

extension UILabel {
    
    static func setLineSpacing(text: String, spacing:CGFloat = 5) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: text)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = getProportionalWidth(width: spacing) // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttributes([NSAttributedStringKey.font: Font.setAveNirNextPro(font: .Medium, size: 13.2, isChangeAsPerDevice: true)!,NSAttributedStringKey.foregroundColor:UIColor.customBlackColor()], range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        return attributedString
    }
}


class UILabelLatoBold: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeFont()
    }
    
    func changeFont() {
        self.textColor = UtilityClass.setNavigationTitleColor()
        self.font = Font.getLatoFont(font: .Bold, size: getProportionalFont(size: 13.0))!
    }
    
}

class UILabelLatoRegular: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.black
        self.font = Font.getLatoFont(font: .Regular, size: getProportionalFont(size: 16.0))!
    }
    
}

class LabelNexaRustSans: UILabel {
    override func awakeFromNib() {
        self.font = Font.setFont(name: Nexa_Rust_Sans_Black, size: 17.0)
        self.textColor = UIColor.getYellowColor()
        super.awakeFromNib()
    }
}

class LabelNexaRustSansMaroon: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: Nexa_Rust_Sans_Black, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setAppTheamTextColor()
    }
}

class LabelNexaRustSansBlackMaroon: UILabel {
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: Nexa_Rust_Sans_Black, size: fontSize)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setTextFieldBottomColor()
    }
}

//MARK: KelsonSans Label

class LabelKelsonSans: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.init(name: KelsonSans_Light, size: 19.8)
        self.textColor = UIColor.getYellowColor()
    }
}

class LabelKelsonSansLight: UILabel {
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: KelsonSans_Light, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.getNavigationBarColor()
    }
}


class LabelKelsonSansRegular: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: KelsonSans_Regular, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.getYellowColor()
    }
}

class LabelKelsonSansRegularMaroon: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: KelsonSans_Regular, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setAppTheamTextColor()
    }
}

class LabelKelsonSansBoldMaroon: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 10.0 {
        didSet {
            self.font = UIFont.init(name: KelsonSans_Bold, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.setAppTheamTextColor()
    }
}

//MARK: Foorder App

class LabelAveNirNextProGrayMedium: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 13.2 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.colorGray()
        self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
    }
}

class LabelAveNirNextProBlackDemi: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 18.8 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.customBlackColor()
        self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
    }
}


class LabelAveNirNextProBlackMeduim: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 13.2 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.customBlackColor() {
        didSet {
            self.textColor = color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = color
        self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
    }
}

class LabelAveNirNextProDemiWhite: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 14.5 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.customWhiteColor() {
        didSet {
            self.textColor = color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = color
        self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
    }
}

class LabelAveNirNextProDemiOrange: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 14.5 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.colorOrange()
        self.font = Font.setAveNirNextPro(font: .Demi, size: fontSize)
    }
}

class LabelAveNirNextProBlackGreen: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 13.2 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.appGreenColor()
        self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
    }
}


class LabelAveNirNextProBoldWhite: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 15.7 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Bold, size: fontSize)
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.customWhiteColor() {
        didSet {
            self.textColor = color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = color
        self.font = Font.setAveNirNextPro(font: .Bold, size: fontSize)
    }
}


class LabelAveNirNextProMediumWhite: UILabel {
    
    @IBInspectable
    public var fontSize: CGFloat = 11.3 {
        didSet {
            self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = UIColor.customWhiteColor()
        self.font = Font.setAveNirNextPro(font: .Medium, size: fontSize)
    }
}
