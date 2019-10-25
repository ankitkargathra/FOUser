//
//  RatePopupVC.swift
//  FoodOrder
//
//  Created by Rohan on 04/11/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class RatePopupVC: BaseVC {
    
    
    @IBOutlet var bottomConstrint: NSLayoutConstraint!
    @IBOutlet var btnRates: [UIButton]!
    @IBOutlet var viewRate: UIView!
    @IBOutlet var viewSize: UIView!
    @IBOutlet var tableView: TableViewFoodSize!
    @IBOutlet var imgVeg: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblPricePlusAddonPrice: UILabel!
    @IBOutlet var lblAddItem: LabelAveNirNextProDemiWhite!
    @IBOutlet weak var txtViewReview: UITextView!
    @IBOutlet weak var imgRestautant: RoundImageView!
    @IBOutlet weak var lblRestautantName: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblRestautantAddress: LabelAveNirNextProGrayMedium!
    
    var isRate: Bool = true
    var addOn: AddOns!
    var item: MenuData!
    var isUpdate = false
    var isFromList = false
    var orderId:String!
    var restautantId:String!
    var restautantName:String!
    var picture:String!
    var restaurantAddress:String!
    var rate:Int!
    var placeholdertextview = "Your review will impact the restaurant's overall rating and will help others make better choice."
    var delegatemyOrder:MyOrderVC!
    var delegatemyHome:HomeVC!
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clear
        super.viewDidLoad()
        self.setViewHidden(rate: !isRate)
        
        if !isFromList{
            if isUpdate == false {
                lblAddItem.text = "Add Item"
                self.lblPricePlusAddonPrice.text = item.itemPrice.add$Tag()
            } else {
                lblAddItem.text = "Update"
                var addonsValue: Double! = 0
                if item.customizeOptions != nil {
                    for addONs in item.customizeOptions.customizeOptions {
                        for addon in addONs {
                            if addon.selected == true {
                                addonsValue = addonsValue + (Double.init(addon.price!)! * Double.init(item.addedInCartValue))
                            }
                        }
                    }
                }
                
                self.lblPricePlusAddonPrice.text = "\(String.init(format: "%.2f", (Double.init(item.itemPrice!)! * Double.init(item.addedInCartValue)) + addonsValue))".add$Tag()
            }
        }else{
            txtViewReview.delegate = self
            lblRestautantName.text = restautantName
            lblRestautantAddress.text = restaurantAddress
            if let img = picture {
                self.imgRestautant.kf.setImage(with: URL.init(string: img))
            }
        }
        if isRate == false {
            tableView.addOn = self.addOn
            tableView.reloadData()
            lblName.text = item.itemName!
            lblPrice.text = checkNULL(str: item.itemPrice).add$Tag()
            imgVeg.image = item.isVeg == "1" ? UIImage.init(named: "veg") : UIImage.init(named: "non_veg")
        }
        
        self.tableView.blockTableViewDidSelectAtIndexPath = { (indexPath) in
            
            if self.isUpdate == true {
                var addonsValue: Double! = 0
                if self.item.customizeOptions != nil {
                    for addONs in self.item.customizeOptions.customizeOptions {
                        for addon in addONs {
                            if addon.selected == true {
                                addonsValue = addonsValue + (Double.init(addon.price!)! * Double.init(self.item.addedInCartValue))
                            }
                        }
                    }
                }
                
                self.lblPricePlusAddonPrice.text = "\(String.init(format: "%.2f", (Double.init(self.item.itemPrice!)! * Double.init(self.item.addedInCartValue)) + addonsValue))".add$Tag()
            } else {
                var total = Double.init(self.item.itemPrice!)!
                for items in self.addOn.customizeOptions {
                    for item in items {
                        if item.selected == true {
                            total = total + Double.init(item.price!)!
                        }
                    }
                }
                self.lblPricePlusAddonPrice.text = String.init(format: "%.2f", total).add$Tag()
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadCart"), object: nil)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.setBlack(alpha: 0.4)
        }) { (completion) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func btnDismissPress() {
        self.bottomConstrint.constant = -getProportionalHeight(height: 459)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.setBlack(alpha: 0.0)
            self.view.layoutIfNeeded()
        }) { (completion) in
            self.dismiss(animated: true, completion: nil)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setupCart"), object: nil)
    }
    
    @IBAction func addItemPress() {
        
        
        if isUpdate == false {
            if let itemCount = CartData.shared.items.filter({ (menuData) -> Bool in
                return "\(self.item.id!)" == "\(menuData.id!)"
            }) as [MenuData]? {
                
                if itemCount.count == 0 {
                    item.customizeOptions = addOn
                    item.addedInCartValue = item.addedInCartValue + 1
                    let menuData = MenuData.init(fromDictionary: item.toDictionary())
                    CartData.shared.items.append(menuData)
                } else {
                    var selectedIds = ""
                    for items in self.addOn.customizeOptions {
                        for item in items {
                            if item.selected == true {
                                selectedIds.append(item.id)
                            }
                        }
                    }
                    var selectedIdsFromAlready = ""
                    for menuItem in itemCount {
                        for items in menuItem.customizeOptions.customizeOptions {
                            for item in items {
                                if item.selected == true {
                                    selectedIdsFromAlready.append(item.id)
                                }
                            }
                        }
                        if selectedIdsFromAlready == selectedIds {
                            print("Found Same")
                            menuItem.addedInCartValue = menuItem.addedInCartValue + 1
                            break
                        }
                    }
                    
                    if selectedIdsFromAlready != selectedIds {
                        item.customizeOptions = addOn
                        item.addedInCartValue = item.addedInCartValue + 1
                        let menuData = MenuData.init(fromDictionary: item.toDictionary())
                        menuData.addedInCartValue = 1
                        CartData.shared.items.append(menuData)
                    }
                }
            }
        }
        self.btnDismissPress()
        
        //        if let cItem = CartData.shared.items.first(where: { (data) -> Bool in
        //            return "\(self.item.id!)" == "\(data.id!)"
        //        }) {
        //
        //            for ad in cItem.customizeOptions {
        //                if addOn == ad {
        //                    print("Same")
        //                } else {
        //                    print("Not")
        //                }
        //            }
        //
        //
        //
        //        } else {
        //            item.customizeOptions.append(addOn)
        //            item.addedInCartValue = item.addedInCartValue + 1
        //            CartData.shared.items.append(item)
        //        }
        
        
    }
    
    @IBAction func btnRatePress(sender: UIButton) {
        let stackView = sender.superview as! UIStackView
        rate = sender.tag
        for viewObj in stackView.arrangedSubviews {
            
            if viewObj.isKind(of: UIButton.classForCoder()) {
                let button = viewObj as! UIButton
                if button.tag <= sender.tag {
                    button.isSelected = true
                } else {
                    button.isSelected = false
                }
            }
        }
    }
    @IBAction func btnSubmitPress(_ sender: GreenBGButton) {
        if txtViewReview.text == placeholdertextview{
            txtViewReview.text = ""
        }
        UtilityClass.showHUD()
        let params = ["order_id":orderId!,"restaurent_id":restautantId!,"review":txtViewReview.text!,"ratings":String(rate)] as JSONDICTIONARY
        ApiController.shared.ratingReview(Params: params) { (success, message, response) in
        UtilityClass.hideHUD()
            if success {
                if let dele = self.delegatemyOrder{
                    dele.getmyorderData()
                }
                if let dele = self.delegatemyHome{
                    dele.getDashboardDetails()
                }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setViewHidden(rate: Bool) {
        self.viewRate.isHidden = rate
        self.viewSize.isHidden = !rate
    }
}
extension RatePopupVC:UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView.text.trim() == placeholdertextview{
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView){
        if textView.text.trim() == ""
        {
            textView.text = placeholdertextview
            textView.textColor = UIColor.colorGray()
        }
    }
}
