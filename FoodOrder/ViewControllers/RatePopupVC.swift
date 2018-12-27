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
    
    var isRate: Bool = true
    
    @IBOutlet var tableView: TableViewFoodSize!
    var addOn: AddOns!
    var item: MenuData!
    @IBOutlet var imgVeg: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblPricePlusAddonPrice: UILabel!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clear
        super.viewDidLoad()
        self.setViewHidden(rate: !isRate)
        
        if isRate == false {
            tableView.addOn = self.addOn
            tableView.reloadData()
            lblName.text = item.itemName!
            lblPrice.text = checkNULL(str: item.itemPrice).add$Tag()
            imgVeg.image = item.isVeg == "1" ? UIImage.init(named: "veg") : UIImage.init(named: "non_veg")
            
        }
        
        self.lblPricePlusAddonPrice.text = "\(String.init(format: "%@", self.item.itemPrice!))".add$Tag()
        
        self.tableView.blockTableViewDidSelectAtIndexPath = { (indexPath) in
            
            var total: Double = Double.init(self.item.itemPrice!)!
            
            for items in self.addOn.customizeOptions {
                for item in items {
                    if item.selected == true {
                        total = total + Double.init(item.price!)!
                    }
                }
            }
            
            self.lblPricePlusAddonPrice.text = "\(String.init(format: "%.2f", total))".add$Tag()
            
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
        
//        if let item  = CartData.shared.items.first(where: { (itemData) -> Bool in
//            return "\(itemData.id!)" == self.item.id!
//        }) {
//            item.customizeOptions.append(addOn)
//            self.item.addedInCartValue = self.item.addedInCartValue + 1
//        } else {
//            item.customizeOptions.append(addOn)
//            item.addedInCartValue = item.addedInCartValue + 1
//            CartData.shared.items.append(item)
//        }
        
        let itemOBj = MenuData
        
        item.customizeOptions.append(addOn)
        item.addedInCartValue = item.addedInCartValue + 1
        CartData.shared.items.append(itemOBj)
        
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
    
    func setViewHidden(rate: Bool) {
        self.viewRate.isHidden = rate
        self.viewSize.isHidden = !rate
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
