//
//  AnimationClass.swift
//  Starbox
//
//  Created by Rohan on 24/06/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import Foundation
import UIKit

class AnimationClass {
    
    static func setIdentityScaleZero(view:UIView) {
        view.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    static func setDefaultIdentity(view:UIView) {
        self.setIdentityScaleZero(view: view)
        UIView.animate(withDuration: 0.6) {
            view.transform = CGAffineTransform.identity
        }
    }
    
}
