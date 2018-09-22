//
//  NavigationBar.swift
//  PopTasker
//
//  Created by Rohan on 29/08/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowImage = UIImage()
        self.setBackgroundImage(UIImage(), for: .default)
    }
    
    
}
