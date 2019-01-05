//
//  AK_String.swift
//  PopTasker
//
//  Created by Rohan on 21/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func add$Tag() -> String {
        return "$" + self
    }
    
    func remove$sign() -> String {
        return self.replacingOccurrences(of: "$", with: "")
    }
    
    func removeStarsign() -> String {
        return self.replacingOccurrences(of: "*", with: "")
    }
    
    func addAtTag() -> String {
        return "@" + self
    }
    
    func trim() -> String
    {
        var str = self.trimmingCharacters(in: NSCharacterSet.whitespaces)
        str = str.trimmingCharacters(in: NSCharacterSet.newlines)
        return str
    }
    
    mutating func removeChar(number: Int) -> String {
        if self.count >= number {
            for _ in 1...number{
                self = String(self.dropFirst())
            }
        }
        return self
    }
    
    
    mutating func setHexString() -> String {
        if self.hasPrefix("#") {
            self = self.removeChar(number: 1)
        }
        
        if self.count == 8 {
            self = self.removeChar(number: 2)
        }
        return "#" + self
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
