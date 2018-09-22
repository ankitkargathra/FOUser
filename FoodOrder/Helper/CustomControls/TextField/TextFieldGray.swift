
//
//  TextFieldGrat.swift
//  PopTasker
//
//  Created by Admin on 05/09/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

class TextFieldGray: TextField {
    
    override func draw(_ rect: CGRect) {
        self.textColor = UIColor.customGrayColor()
        self.setValue(UIColor.customGrayColor(), forKeyPath: "_placeholderLabel.textColor")
        self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: 20))
    }
}
