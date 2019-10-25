//
//  TextWithRightButton.swift
//  PopTasker
//
//  Created by Admin on 30/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import Foundation
@IBDesignable
class TextWithRightButton: UITextField {
   
    var width: CGFloat = 5
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
            self.layer.borderWidth = 1
            self.font = UIFont(name: "Montserrat-Regular", size: 16)
            self.layer.cornerRadius = 15
            self.clipsToBounds = true
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
            
            self.layer.borderColor = UIColor.black.cgColor

    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            self.textColor = color
        }
    }
    
    func updateView() {
        if let image = rightImage {
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30 , height: 30))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: color])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
