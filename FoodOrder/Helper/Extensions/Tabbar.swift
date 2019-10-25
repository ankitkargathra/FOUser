//
//  Tabbar.swift
//  PopTasker
//
//  Created by Rohan on 29/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

extension UITabBar {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
         self.backgroundImage = GradientImage.gradientTheamBackgroundFrame(view: self)
        self.shadowImage = UIImage()
    }
    
}
// Tabbar Lign
extension UIImage{
    
    //Draws the top indicator by making image with filling color
    class func drawTabBarIndicator(color: UIColor, size: CGSize, onTop: Bool) -> UIImage {
        let indicatorHeight = size.height / 30
        let yPosition = onTop ? 0 : ((Devices.deviceType == .iPhoneX ? size.height - 34 : size.height) - indicatorHeight)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: yPosition, width: size.width, height: indicatorHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
