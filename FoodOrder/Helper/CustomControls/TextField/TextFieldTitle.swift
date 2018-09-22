//
//  TextFieldTitle.swift
//  PopTasker
//
//  Created by Rohan on 20/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class TextFieldTitle: TextField {
    
    var leftLbl: LabelNeueBold!
    
    override func draw(_ rect: CGRect) {
        self.addBottomLign()
        self.setValue(UIColor.customGrayColor(), forKeyPath: "_placeholderLabel.textColor")
        self.font = Font.setHelvaticaNeueLTPro(font: .NeueLight, size: getProportionalFont(size: 16))
    }
    
    func setLeftTitle(title: String) {
        if leftLbl == nil {
            leftLbl = LabelNeueBold.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: self.frame.size.height))
            self.leftViewMode = .always
            self.leftView = leftLbl
        }
        leftLbl.text = title   
    }
}
