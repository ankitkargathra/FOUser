//
//  RegisterTextField.swift
//  PopTasker
//
//  Created by Rohan on 21/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

class LoginTextField: TextField {
    
    override func draw(_ rect: CGRect) {
        self.textColor = UIColor.white
        self.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: 20.8))
    }
}
