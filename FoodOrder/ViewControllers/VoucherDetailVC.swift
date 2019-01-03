//
//  VoucherDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 25/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class VoucherDetailVC: BaseVC {

    var voucher: Voucher!
    @IBOutlet var tblVoucherDtl: TableViewApplyDetailVaucher!
    
    override func viewDidLoad() {
        tblVoucherDtl.voucher = voucher
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: checkNULL(str: voucher.restaurantName), subtitle: checkNULL(str: voucher.restaurantAddress))
        super.viewDidLoad()
        
        //["Valid once per user.", "Valid on all modes of payment.", "Offer not valid on Pan Pizzas.", "Other T&C may apply.", "Offer valid till Aug 31, 2018 23:59 PM."]

        if voucher.perPersonOnce == "1" {
            tblVoucherDtl.offerArray.append("Valid once per user.")
        }
        tblVoucherDtl.offerArray.append("Valid on all modes of payment.")
        tblVoucherDtl.offerArray.append("Other T&C may apply.")
        tblVoucherDtl.offerArray.append("Offer valid till \(Date.convertDateToValidDate(date: voucher.endDate))")
        
        
        self.tblVoucherDtl.reloadData()
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
