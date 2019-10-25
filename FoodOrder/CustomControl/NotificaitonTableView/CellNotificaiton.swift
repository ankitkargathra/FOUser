//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellNotificaiton: BaseTableViewCell {

    @IBOutlet weak var lblNotification: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblTime: LabelAveNirNextProGrayMedium!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(noti: Notification){
        self.lblNotification.text = checkNULL(str: noti.notification)
        
    }
    
}
