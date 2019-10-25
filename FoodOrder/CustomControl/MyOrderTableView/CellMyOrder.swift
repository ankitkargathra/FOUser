//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellMyOrder: BaseTableViewCell {

   
    @IBOutlet weak var viewRated: UIView!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBlackGreen!
    @IBOutlet weak var btnRateNow: ButtonAveNirNextProMediumGray!
    @IBOutlet weak var restrutantName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblTime: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblAmount: LabelAveNirNextProBlackDemi!
    @IBOutlet weak var lblAddress: LabelAveNirNextProGrayMedium!
    @IBOutlet weak var lblItemName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var imgRestarutantProPic: RoundImageView!
    @IBOutlet weak var lblRate: LabelAveNirNextProBlackMeduim!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellDataCurrentOrder(C:CurrentOrder) {
      
        if C.isRate == "0"{
            self.viewRated.isHidden = true
            self.btnRateNow.isHidden = false
        }else{
            self.viewRated.isHidden = false
            self.btnRateNow.isHidden = true
            self.lblRate.text = C.ratings
        }
        self.lblOrderStatus.textColor = UIColor.appGreenColor()
        self.lblOrderStatus.text = C.orderStatus//"Order is being prepared"
        self.restrutantName.text = checkNULL(str: C.restaurantName)
        self.lblAddress.text = checkNULL(str: C.restaurentAddress)
        self.lblAmount.text = checkNULL(str: C.grandTotal).add$Tag()
        self.lblTime.text = Date.convertDate(date: C.orderDate!)
        let arr:NSMutableArray = []
        var joined:String!
        for value in C.orderItems{
          arr.add(value.quantity+"x "+value.itemName)
          joined = arr.componentsJoined(by: ", ")
        }
        self.lblItemName.text = joined
        if let img = C.picture {
            self.imgRestarutantProPic.kf.setImage(with: URL.init(string: img))
        }
    }
    
    func setCellDataPastOrder(P:PastOrder){
        
        if P.isRate == "0"{
            self.viewRated.isHidden = true
            self.btnRateNow.isHidden = false
        }else{
            self.viewRated.isHidden = false
            self.btnRateNow.isHidden = true
            self.lblRate.text = P.ratings
        }
        self.lblOrderStatus.textColor = UIColor.colorRed()
        self.lblOrderStatus.text = P.orderStatus//"Order is delivered"
        self.restrutantName.text = checkNULL(str: P.restaurantName)
        self.lblAddress.text = checkNULL(str: P.restaurentAddress)
        self.lblAmount.text = checkNULL(str: P.grandTotal).add$Tag()
        self.lblTime.text = Date.convertDate(date: P.orderDate!)
        let arr:NSMutableArray = []
        var joined:String!
        for value in P.orderItems{
            arr.add(value.quantity+"x "+value.itemName)
            joined = arr.componentsJoined(by: ", ")
        }
        self.lblItemName.text = joined
        if let img = P.picture {
            self.imgRestarutantProPic.kf.setImage(with: URL.init(string: img))
        }
    }
    
    func setCellDataRecentOrder(RO:DSActivity){
        
        self.lblOrderStatus.textColor = UIColor.colorRed()
        if RO.isRate == "0"{
            self.viewRated.isHidden = true
        }else{
            self.viewRated.isHidden = false
            self.lblRate.text = String(describing: RO.rating)
        }
        self.lblOrderStatus.text = "Order is delivered"
        self.restrutantName.text = checkNULL(str: RO.restaurantName)
        self.lblAddress.text = checkNULL(str: RO.restaurantAddress)
        self.lblAmount.text = checkNULL(str: RO.grandTotal).add$Tag()
        self.lblTime.text = Date.convertDate(date: RO.orderDate!)
        let arr:NSMutableArray = []
        var joined:String!
        for value in RO.items{
            arr.add(value.quantity+"x "+value.itemName)
            joined = arr.componentsJoined(by: ", ")
        }
        self.lblItemName.text = joined
        if let img = RO.picture {
            self.imgRestarutantProPic.kf.setImage(with: URL.init(string: img))
        }
    }
}
