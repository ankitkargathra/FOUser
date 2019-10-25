//
//  CellVaucher.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellSpecialInst: UITableViewCell, UITextViewDelegate {

   
    @IBOutlet weak var lblSelectVoucher: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblSelectedVoucher: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var lblVoucherDetails: LabelAveNirNextProBlackMeduim!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var textview: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textview.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setCellApplyCode(applyed: Bool) {
        lblSelectVoucher.isHidden = applyed
        rightArrow.isHidden = applyed
        
        lblSelectedVoucher.isHidden = !applyed
        lblVoucherDetails.isHidden = !applyed
        btnClose.isHidden = !applyed
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Allergic to something? Want your food less spicy? Mention all custom requests here..." {
            textView.text = ""
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trim().count == 0 {
            textView.text = "Allergic to something? Want your food less spicy? Mention all custom requests here..."
            CartData.shared.special_cooking_instructions = ""
        } else {
            CartData.shared.special_cooking_instructions = textView.text!
        }
    }
    
}
