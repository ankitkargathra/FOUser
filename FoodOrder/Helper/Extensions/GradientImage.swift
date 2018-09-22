//
//  GradientImage.swift
//  PopTasker
//
//  Created by Rohan on 29/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

class GradientImage {
    
    class func gradientTheamBackgroundFrame(view: UIView) -> UIImage{
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        let sizeLength = UIScreen.main.bounds.size.width
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: view.frame.size.height)
        gradient.frame = defaultNavigationBarFrame
        gradient.colors = [UIColor(red: 0/255, green: 22/255, blue: 59/255, alpha: 1).cgColor, UIColor(red: 65/255, green: 183/255, blue: 200/255, alpha: 1).cgColor]
        return self.image(fromLayer: gradient)
        
    }
    
    class func getPlainColor(view: UIView) -> UIImage {
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        let sizeLength = UIScreen.main.bounds.size.width
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: view.frame.size.height)
        gradient.frame = defaultNavigationBarFrame
        gradient.colors = [UIColor(red: 65/255, green: 183/255, blue: 200/255, alpha: 1).cgColor, UIColor(red: 65/255, green: 183/255, blue: 200/255, alpha: 1).cgColor]
        return self.image(fromLayer: gradient)
        
    }
    
    
    class func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
    
}
