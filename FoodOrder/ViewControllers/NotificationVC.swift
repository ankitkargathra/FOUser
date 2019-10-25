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
        getNotifications()
    }

    //MARK: Get notifications
    
    func getNotifications() {
        
        ApiController.shared.getNotifications { (success, message, response) in
            
            if success == true {
                
                if let notifications = response {
                    for notification in notifications {
                        let noti = Notification.init(fromDictionary: notification)
                        self.tableViewNotificaiton.notificationArr.append(noti)
                    }
                }
                self.tableViewNotificaiton.reloadData()
            }else{
                self.tableViewNotificaiton.isHidden = true
            }
        }
    }
}
