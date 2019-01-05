//
//  Color.swift
//  comon
//
//  Created by Ankit on 27/01/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

enum ColorType {
    
    case signInPurple
    case signInFb
    case signInGoogle
    var color: UIColor {
        switch self {
        case .signInPurple: return UIColor.setPurpalColor()
        case .signInGoogle: return UIColor.setRedGoogleColor()
        case .signInFb: return UIColor.setBlueFbColor()
        }
    }
}

extension UIColor {
    
    static func setColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    //MARK: --
    //MARK: FoodOrder App All Color
    
    static func appGreenColor() -> UIColor {
        return UIColor.setColor(red: 1, green: 180, blue: 95)
    }
    
    static func dotIntroUnselect() -> UIColor {
        return UIColor.setColor(red: 219, green: 230, blue: 237)
    }
    
    static func dotIntroselect() -> UIColor {
        return UIColor.setColor(red: 87, green: 99, blue: 107)
    }
    
    
    static func colorGray() -> UIColor {
        return UIColor.setColor(red: 96, green: 106, blue: 116)
    }
    
    static func colorOrange() -> UIColor {
        return UIColor.setColor(red: 251, green: 128, blue: 25)
    }

    
    static func colorLightSky() -> UIColor {
        return UIColor.setColor(red: 153, green: 166, blue: 179)
    }
    
    static func colorRed() -> UIColor {
        return UIColor.setColor(red: 231, green: 14, blue: 14)
    }
    
    //MARK: ---
    
    
    
    static func getYellowColor() -> UIColor {
        return UIColor.setColor(red: 255, green: 236, blue: 29)
    }
    
    static func getNavigationBarColor() -> UIColor {
        return UIColor.setColor(red: 166, green: 0, blue: 154)
    }
    
    static func setgray_182_182_182_Bg() -> UIColor {
        return UIColor.setColor(red: 182, green: 182, blue: 182)
    }
    
    static func setAppTheamTextColor() -> UIColor {
        return UIColor.setColor(red: 87, green: 0, blue: 76)
    }
    
    static func setTextFieldBottomColor() -> UIColor {
        return UIColor.setColor(red: 67, green: 0, blue: 62)
    }
    
    static func setButtonColor() -> UIColor {
        return UIColor.setColor(red: 95, green: 86, blue: 142)
    }
    
    static func setDark() -> UIColor {
        return UIColor.setColor(red: 32, green: 34, blue: 42, alpha: 0.48)
    }
    
    static func customGrayColor() -> UIColor {
        return UIColor.setColor(red: 128, green: 128, blue: 128)
    }
    
    static func setgray_119_119_119() -> UIColor {
        return UIColor.setColor(red: 119, green: 119, blue: 119)
    }
    
    static func setBlack_0_0_23() -> UIColor {
        return UIColor.setColor(red: 0, green: 0, blue: 23)
    }
    static func setBlack_0_2_48() -> UIColor {
        return UIColor.setColor(red: 0, green: 2, blue: 48)
    }
    static func customBlackColor() -> UIColor {
        return UIColor.setColor(red: 0, green: 0, blue: 0)
    }
    static func customWhiteColor() -> UIColor {
        return UIColor.setColor(red: 255, green: 255, blue: 255)
    }

    static func setPurpalColor() -> UIColor {
        return UIColor.setColor(red: 48, green: 35, blue: 80)
    }
    
    static func setBlueFbColor() -> UIColor {
        return UIColor.setColor(red: 70, green: 89, blue: 149)
    }
    
    static func setRedGoogleColor() -> UIColor {
        return UIColor.setColor(red: 173, green: 68, blue: 50)
    }
    
    static func setGrayLignColor() -> UIColor {
        return UIColor.setColor(red: 210, green: 210, blue: 210)
    }
    
    static func setGreenColor() -> UIColor {
        return UIColor.setColor(red: 1, green: 180, blue: 96)
    }
    
    static func setOrderGreenColor() -> UIColor {
        return UIColor.setColor(red: 0, green: 216, blue: 115)
    }
    
    static func setCustomRedColor() -> UIColor {
        return UIColor.setColor(red: 201, green: 66, blue: 46)
    }
    static func setGrayFont136_129_139() -> UIColor {
        return UIColor.setColor(red: 136, green: 129, blue: 139)
    }
    
    
    //MARK:- Group Avtivity cardColord
    
    static func setCardLightGreenColor(alpha:CGFloat = 1.0) -> UIColor {
        return UIColor.setColor(red: 234, green: 246, blue: 229, alpha: alpha)
    }
    
    static func setPaleOliveGreenColor(alpha:CGFloat = 1.0) -> UIColor {
        return UIColor.setColor(red: 148, green: 210, blue: 123, alpha: alpha)
    }

    static func setBlack(alpha:CGFloat = 1.0) -> UIColor {
        return UIColor.setColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    //MARK:- Group Avtivity cardColord
}

import UIKit
public extension UIColor {
    /**
     Creates an immuatble UIColor instance specified by a hex string, CSS color name, or nil.
     - parameter hexString: A case insensitive String? representing a hex or CSS value e.g.
     - **"abc"**
     - **"abc7"**
     - **"#abc7"**
     - **"00FFFF"**
     - **"#00FFFF"**
     - **"00FFFF77"**
     - **"Orange", "Azure", "Tomato"** Modern browsers support 140 color names (<http://www.w3schools.com/cssref/css_colornames.asp>)
     - **"Clear"** [UIColor clearColor]
     - **"Transparent"** [UIColor clearColor]
     - **nil** [UIColor clearColor]
     - **empty string** [UIColor clearColor]
     */
    public convenience init(hex: String?) {
        let normalizedHexString: String = UIColor.normalize(hex)
        var c: CUnsignedInt = 0
        Scanner(string: normalizedHexString).scanHexInt32(&c)
        self.init(red:UIColorMasks.redValue(c), green:UIColorMasks.greenValue(c), blue:UIColorMasks.blueValue(c), alpha:UIColorMasks.alphaValue(c))
    }
    /**
     Returns a hex equivalent of this UIColor.
     - Parameter includeAlpha:   Optional parameter to include the alpha hex.
     color.hexDescription() -> "ff0000"
     color.hexDescription(true) -> "ff0000aa"
     - Returns: A new string with `String` with the color's hexidecimal value.
     */
    public func hexDescription(_ includeAlpha: Bool = false) -> String {
        guard self.cgColor.numberOfComponents == 4 else {
            return "Color not RGB."
        }
        let a = self.cgColor.components!.map { Int($0 * CGFloat(255)) }
        let color = String.init(format: "%02x%02x%02x", a[0], a[1], a[2])
        if includeAlpha {
            let alpha = String.init(format: "%02x", a[3])
            return "\(color)\(alpha)"
        }
        return color
    }
    
    fileprivate enum UIColorMasks: CUnsignedInt {
        case redMask    = 0xff000000
        case greenMask  = 0x00ff0000
        case blueMask   = 0x0000ff00
        case alphaMask  = 0x000000ff
        static func redValue(_ value: CUnsignedInt) -> CGFloat {
            return CGFloat((value & redMask.rawValue) >> 24) / 255.0
        }
        static func greenValue(_ value: CUnsignedInt) -> CGFloat {
            return CGFloat((value & greenMask.rawValue) >> 16) / 255.0
        }
        static func blueValue(_ value: CUnsignedInt) -> CGFloat {
            return CGFloat((value & blueMask.rawValue) >> 8) / 255.0
        }
        static func alphaValue(_ value: CUnsignedInt) -> CGFloat {
            return CGFloat(value & alphaMask.rawValue) / 255.0
        }
    }
    fileprivate static func normalize(_ hex: String?) -> String {
        guard var hexString = hex else {
            return "00000000"
        }
        if let cssColor = cssToHexDictionairy[hexString.uppercased()] {
            return cssColor.count == 8 ? cssColor : cssColor + "ff"
        }
        if hexString.hasPrefix("#") {
            hexString = String(hexString.dropFirst())
        }
        if hexString.count == 3 || hexString.count == 4 {
            hexString = hexString.map { "\($0)\($0)" } .joined()
        }
        let hasAlpha = hexString.count > 7
        if !hasAlpha {
            hexString += "ff"
        }
        return hexString
    }
    /**
     All modern browsers support the following 140 color names (see http://www.w3schools.com/cssref/css_colornames.asp)
     */
    fileprivate static func hexFromCssName(_ cssName: String) -> String {
        let key = cssName.uppercased()
        if let hex = cssToHexDictionairy[key] {
            return hex
        }
        return cssName
    }
    fileprivate static let cssToHexDictionairy: [String: String] = [
        "CLEAR": "00000000",
        "TRANSPARENT": "00000000",
        "": "00000000",
        "ALICEBLUE": "F0F8FF",
        "ANTIQUEWHITE": "FAEBD7",
        "AQUA": "00FFFF",
        "AQUAMARINE": "7FFFD4",
        "AZURE": "F0FFFF",
        "BEIGE": "F5F5DC",
        "BISQUE": "FFE4C4",
        "BLACK": "000000",
        "BLANCHEDALMOND": "FFEBCD",
        "BLUE": "0000FF",
        "BLUEVIOLET": "8A2BE2",
        "BROWN": "A52A2A",
        "BURLYWOOD": "DEB887",
        "CADETBLUE": "5F9EA0",
        "CHARTREUSE": "7FFF00",
        "CHOCOLATE": "D2691E",
        "CORAL": "FF7F50",
        "CORNFLOWERBLUE": "6495ED",
        "CORNSILK": "FFF8DC",
        "CRIMSON": "DC143C",
        "CYAN": "00FFFF",
        "DARKBLUE": "00008B",
        "DARKCYAN": "008B8B",
        "DARKGOLDENROD": "B8860B",
        "DARKGRAY": "A9A9A9",
        "DARKGREY": "A9A9A9",
        "DARKGREEN": "006400",
        "DARKKHAKI": "BDB76B",
        "DARKMAGENTA": "8B008B",
        "DARKOLIVEGREEN": "556B2F",
        "DARKORANGE": "FF8C00",
        "DARKORCHID": "9932CC",
        "DARKRED": "8B0000",
        "DARKSALMON": "E9967A",
        "DARKSEAGREEN": "8FBC8F",
        "DARKSLATEBLUE": "483D8B",
        "DARKSLATEGRAY": "2F4F4F",
        "DARKSLATEGREY": "2F4F4F",
        "DARKTURQUOISE": "00CED1",
        "DARKVIOLET": "9400D3",
        "DEEPPINK": "FF1493",
        "DEEPSKYBLUE": "00BFFF",
        "DIMGRAY": "696969",
        "DIMGREY": "696969",
        "DODGERBLUE": "1E90FF",
        "FIREBRICK": "B22222",
        "FLORALWHITE": "FFFAF0",
        "FORESTGREEN": "228B22",
        "FUCHSIA": "FF00FF",
        "GAINSBORO": "DCDCDC",
        "GHOSTWHITE": "F8F8FF",
        "GOLD": "FFD700",
        "GOLDENROD": "DAA520",
        "GRAY": "808080",
        "GREY": "808080",
        "GREEN": "008000",
        "GREENYELLOW": "ADFF2F",
        "HONEYDEW": "F0FFF0",
        "HOTPINK": "FF69B4",
        "INDIANRED": "CD5C5C",
        "INDIGO": "4B0082",
        "IVORY": "FFFFF0",
        "KHAKI": "F0E68C",
        "LAVENDER": "E6E6FA",
        "LAVENDERBLUSH": "FFF0F5",
        "LAWNGREEN": "7CFC00",
        "LEMONCHIFFON": "FFFACD",
        "LIGHTBLUE": "ADD8E6",
        "LIGHTCORAL": "F08080",
        "LIGHTCYAN": "E0FFFF",
        "LIGHTGOLDENRODYELLOW": "FAFAD2",
        "LIGHTGRAY": "D3D3D3",
        "LIGHTGREY": "D3D3D3",
        "LIGHTGREEN": "90EE90",
        "LIGHTPINK": "FFB6C1",
        "LIGHTSALMON": "FFA07A",
        "LIGHTSEAGREEN": "20B2AA",
        "LIGHTSKYBLUE": "87CEFA",
        "LIGHTSLATEGRAY": "778899",
        "LIGHTSLATEGREY": "778899",
        "LIGHTSTEELBLUE": "B0C4DE",
        "LIGHTYELLOW": "FFFFE0",
        "LIME": "00FF00",
        "LIMEGREEN": "32CD32",
        "LINEN": "FAF0E6",
        "MAGENTA": "FF00FF",
        "MAROON": "800000",
        "MEDIUMAQUAMARINE": "66CDAA",
        "MEDIUMBLUE": "0000CD",
        "MEDIUMORCHID": "BA55D3",
        "MEDIUMPURPLE": "9370DB",
        "MEDIUMSEAGREEN": "3CB371",
        "MEDIUMSLATEBLUE": "7B68EE",
        "MEDIUMSPRINGGREEN": "00FA9A",
        "MEDIUMTURQUOISE": "48D1CC",
        "MEDIUMVIOLETRED": "C71585",
        "MIDNIGHTBLUE": "191970",
        "MINTCREAM": "F5FFFA",
        "MISTYROSE": "FFE4E1",
        "MOCCASIN": "FFE4B5",
        "NAVAJOWHITE": "FFDEAD",
        "NAVY": "000080",
        "OLDLACE": "FDF5E6",
        "OLIVE": "808000",
        "OLIVEDRAB": "6B8E23",
        "ORANGE": "FFA500",
        "ORANGERED": "FF4500",
        "ORCHID": "DA70D6",
        "PALEGOLDENROD": "EEE8AA",
        "PALEGREEN": "98FB98",
        "PALETURQUOISE": "AFEEEE",
        "PALEVIOLETRED": "DB7093",
        "PAPAYAWHIP": "FFEFD5",
        "PEACHPUFF": "FFDAB9",
        "PERU": "CD853F",
        "PINK": "FFC0CB",
        "PLUM": "DDA0DD",
        "POWDERBLUE": "B0E0E6",
        "PURPLE": "800080",
        "RED": "FF0000",
        "ROSYBROWN": "BC8F8F",
        "ROYALBLUE": "4169E1",
        "SADDLEBROWN": "8B4513",
        "SALMON": "FA8072",
        "SANDYBROWN": "F4A460",
        "SEAGREEN": "2E8B57",
        "SEASHELL": "FFF5EE",
        "SIENNA": "A0522D",
        "SILVER": "C0C0C0",
        "SKYBLUE": "87CEEB",
        "SLATEBLUE": "6A5ACD",
        "SLATEGRAY": "708090",
        "SLATEGREY": "708090",
        "SNOW": "FFFAFA",
        "SPRINGGREEN": "00FF7F",
        "STEELBLUE": "4682B4",
        "TAN": "D2B48C",
        "TEAL": "008080",
        "THISTLE": "D8BFD8",
        "TOMATO": "FF6347",
        "TURQUOISE": "40E0D0",
        "VIOLET": "EE82EE",
        "WHEAT": "F5DEB3",
        "WHITE": "FFFFFF",
        "WHITESMOKE": "F5F5F5",
        "YELLOW": "FFFF00",
        "YELLOWGREEN": "9ACD32"
    ]
}
