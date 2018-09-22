//
//  AKTextField.swift
//  Starbox
//
//  Created by Rohan on 24/06/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import UIKit

extension UITextField {
    
//    open override func awakeFromNib() {
//        super.awakeFromNib()
//
//        let fontName = self.font!.fontName
//        var fontSize = self.font!.pointSize
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
    
}

class AKTextField: UITextField {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y: self.frame.size.height - 2))
        
        aPath.addLine(to: CGPoint(x:self.frame.size.width , y:self.frame.size.height - 2))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.getYellowColor().set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
        
        setFont()
        self.setValue(UIColor.getYellowColor(), forKeyPath: "_placeholderLabel.textColor")
        let leftPadding = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: self.frame.size.height))
        self.leftViewMode = .always
        self.leftView = leftPadding
        
    }
    
    func setFont() {
        self.font = UIFont.init(name: KelsonSans_Light, size: 16)
        self.textColor = UIColor.getYellowColor()
    }
}


class AKTextFieldNexaRustBlack: UITextField {
    
    
    let lblBorder = UILabel()
    
    override func draw(_ rect: CGRect) {
        
        self.setFont()
        lblBorder.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.addSubview(lblBorder)
    }
    
    func setBottomBorder() {

        lblBorder.backgroundColor = UIColor.setTextFieldBottomColor()
       
    }
    
    func removeBottomBorder() {
        lblBorder.backgroundColor = UIColor.clear
    }
    
    func setFont() {
        self.font = UIFont.init(name: Nexa_Rust_Sans_Black, size: 12.2)
        self.textColor = UIColor.setAppTheamTextColor()
    }
    
}


class AKTextFieldKelsonSansLightMaroon: UITextField {
    
    let lblBorder = UILabel()
    
    override func draw(_ rect: CGRect) {
        self.setFont()
        lblBorder.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.addSubview(lblBorder)
    }
    
    func setBottomBorder(set: Bool) {
        if set == true {
            lblBorder.backgroundColor = UIColor.setTextFieldBottomColor()
        } else {
            lblBorder.backgroundColor = UIColor.clear
        }
        
        
    }
    
    func setFont() {
        self.font = UIFont.init(name: KelsonSans_Light, size: 16.17)
        self.textColor = UIColor.setAppTheamTextColor()
    }
}

class AKTextFieldKelsonSansBoldMaroon: UITextField {
    
    let lblBorder = UILabel()
    
    override func draw(_ rect: CGRect) {
        self.setFont()
        lblBorder.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.addSubview(lblBorder)
    }
    
    func setBottomBorder() {
        
        lblBorder.backgroundColor = UIColor.setTextFieldBottomColor()
        
    }
    
    func removeBottomBorder() {
        lblBorder.backgroundColor = UIColor.clear
    }
    
    func setFont() {
        self.font = UIFont.init(name: KelsonSans_Bold, size: 16.17)
        self.textColor = UIColor.setAppTheamTextColor()
    }
}
