//
//  Font.swift
//  comon
//
//  Created by Ankit on 28/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

public let Nexa_Rust_Sans_Black = "NexaRustSans-Black"
public let KelsonSans_Light     = "KelsonSans-Light"
public let KelsonSans_Regular   = "KelsonSans-Regular"
public let KelsonSans_Bold   = "KelsonSans-Bold"
public let Lato_Heavy           = "Lato-Heavy"
public let  HelveticaNeueLTPro = "HelveticaNeueLTPro-"
public let  HelveticaNeueLTPro45Light = "Helvetica Neue LT Pro-45 Light"
public let  HelveticaNeueLTPro75Bold = "Helvetica Neue LT Pro-75 Bold"
public let AvenirNext = "AvenirNextLTPro-"

enum FontType: String {
    case Regular = "Regular"
    case Bold = "Bold"
    case Light = "Light"
    case NeueLight = "Lt"
    case NeueBold = "Bd"
    case Demi = "Demi"
}

class Font {
    
    //MARK: ---
    //MARK: FoodOder aPP
    
    static func setAveNirNextPro(font: FontType, size: CGFloat) -> UIFont? {
        return Font.setFont(name: AvenirNext + font.rawValue, size: size)
    }
    
    static func getLatoFont(font: FontType, size: CGFloat) -> UIFont? {
        return Font.setFont(name: "Lato-" + font.rawValue, size: size)
    }
    
    static func setHelvaticaNeueLTPro(font: FontType, size: CGFloat) -> UIFont? {
        return Font.setFont(name: HelveticaNeueLTPro + font.rawValue, size: size)
    }
    
    
    static func setMuseo(name: String = "Museo900-Regular", size: CGFloat = 15) -> UIFont? {
        return UIFont.init(name: name, size: size)
    }
    //San Francisco Text
    
    static func setSanFranciscoText(name: String = "SanFranciscoText-Bold", size: CGFloat = 10) -> UIFont? {
        return UIFont.init(name: name, size: size)
    }


    static func setFont(name: String, size: CGFloat) -> UIFont? {
        return UIFont.init(name: name, size: size)
    }
    
    static func setFontAttribute(font: UIFont) -> [NSAttributedStringKey : Any] {
        return [
            NSAttributedStringKey.font : font,
        ]
    }

}
