//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit
import ValueStepper

class CellMyCartProductItem: UITableViewCell {

   
    @IBOutlet weak var viewRated: UIView!
    @IBOutlet weak var lblOrderStatus: LabelAveNirNextProBlackGreen!
    @IBOutlet weak var imgVeg: UIImageView!
    @IBOutlet weak var lblTitle: LabelAveNirNextProBlackMeduim!
    
    @IBOutlet weak var btnCustomize: ButtonAveNirNextProMediumGray!
    @IBOutlet weak var imgArrow: UIImageView!
    
    @IBOutlet weak var steperView: ValueStepper!
    @IBOutlet weak var lblPrice: LabelAveNirNextProBlackMeduim!
    
    var blockTableViewSteperPress:((ValueStepper)->Void)?
    var btnCustomizePress:((Int)->Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        steperView.addTarget(self, action: #selector(self.btnSteperPlusPres(_:)), for: UIControlEvents.valueChanged)
        steperView.addTarget(self, action: #selector(self.btnSteperMinusPres(_:)), for: UIControlEvents.touchDown)
        btnCustomize.addTarget(self, action: #selector(self.btnCustomizePress(_:)), for: UIControlEvents.touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(menu: MenuData) {
        
        self.lblTitle.text = checkNULL(str: menu.itemName)
        self.lblPrice.text = checkNULL(str: String.init(format: "%.2f", Double.init(menu.itemPrice)! * Double.init(menu.addedInCartValue!))).add$Tag()
        self.imgVeg.image = menu.isVeg == "1" ? UIImage.init(named: "veg") : UIImage.init(named: "non_veg")
        
        self.steperView.valueLabel.text = "\(menu.addedInCartValue!)"
        self.steperView.value = Double(menu.addedInCartValue!)
        
        self.btnCustomize.isHidden = !menu.customizeOption!
        self.imgArrow.isHidden = !menu.customizeOption!
    }
    
    @IBAction func btnSteperPlusPres(_ sender: ValueStepper) {
        
        if sender.value == 0 {
        }
        
        if(self.blockTableViewSteperPress != nil){
            self.blockTableViewSteperPress!(sender)
        }
    }
    
    @IBAction func btnSteperMinusPres(_ sender: ValueStepper) {
        
        if sender.value == 0 {
        }
        
        if(self.blockTableViewSteperPress != nil){
            self.blockTableViewSteperPress!(sender)
        }
    }
    
    @IBAction func btnCustomizePress(_ button: UIButton) {
        
        if(self.btnCustomizePress != nil) {
            self.btnCustomizePress!(button.tag)
        }
        
    }
}
