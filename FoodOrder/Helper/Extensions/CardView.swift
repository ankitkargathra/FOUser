//
//  CardView.swift
//  comon
//
//  Created by Ankit on 01/02/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.setColor(red: 39, green: 39, blue: 39, alpha: 0.73)
        self.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func dropCardShadow() {
        self.dropShadow()
    }
    
}


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func dropShadow(scale: Bool = false, size:CGSize = CGSize(width: 1, height: 1), shadow:CGFloat = 0) {
        
        self.layer.shadowColor = UIColor.setColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = size
        self.layer.shadowRadius = shadow
    }
    
    func setCornerRadius() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    func setRadius(radius:CGFloat = 4) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBorder(width: CGFloat = 0.4) {
        self.layer.borderWidth = width
        self.layer.borderColor = UIColor.setButtonColor().cgColor
    }
    
    static func setAnimation(view: UIView) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionCurlDown], animations: {
            view.alpha = 1
        }) { (completion) in }
    }
}

extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func addBottomLign() {
        // Drawing code
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y: self.frame.size.height - 2))
        
        aPath.addLine(to: CGPoint(x: self.frame.size.width , y:self.frame.size.height - 2))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.lightGray.set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
    }
}

class ViewRadiusBottoms: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
}


