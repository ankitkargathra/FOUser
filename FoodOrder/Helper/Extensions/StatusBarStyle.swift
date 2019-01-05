//
//  StatusBarStyle.swift
//  PopTasker
//
//  Created by Rohan on 30/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

var darkMode = false
extension UIStatusBarStyle {

    var preferredStatusBarStyle : UIStatusBarStyle {
        return darkMode ? .default : .lightContent
    }
    
}
