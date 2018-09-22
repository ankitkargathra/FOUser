//
//  Label.swift
//  comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

//extension UILabel {
//
//    open override func awakeFromNib() {
//        super.awakeFromNib()
//
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
//    }
//}

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

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
//        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
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

