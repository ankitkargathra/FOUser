//
//  NotificationVC.swift
//  FoodOrder
//
//  Created by Rohan on 07/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class NotificationVC: BaseVC {
    
    @IBOutlet var tableViewNotificaiton: TableViewNotification!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Notifications", subtitle: nil)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
