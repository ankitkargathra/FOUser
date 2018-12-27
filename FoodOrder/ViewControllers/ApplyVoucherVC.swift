//
//  ApplyVoucherVC.swift
//  FoodOrder
//
//  Created by Rohan on 25/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

protocol ApplyVoucherDelegate {
    func getSelectedVoucher(voucher: Voucher)
}

class ApplyVoucherVC: BaseVC {

    @IBOutlet var tblApplyVoucher: TableViewApplyVaucher!
    var delegate: ApplyVoucherDelegate!
    var arrVoucher = [Voucher]()
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Apply Voucher", subtitle: nil)
        super.viewDidLoad()

        tblApplyVoucher.blockTableViewDidSelectAtIndexPath = { (index) in
            if self.delegate != nil {
                CartData.shared.voucherDiscount! = self.arrVoucher[index].discount
                self.delegate.getSelectedVoucher(voucher: self.arrVoucher[index])
            }
            self.navigationController?.popViewController(animated: true)
        }
        // Do any additional setup after loading the view.
        getvoucherData()
    }
    
    func getvoucherData() {
        
        UtilityClass.showHUD()
        ApiController.shared.getVoucers { (success, message, response) in
            UtilityClass.hideHUD()
            
            if success == true {
                if response != nil {
                    
                    for obj in response! {
                        let voucher = Voucher.init(fromDictionary: obj)
                        self.arrVoucher.append(voucher)
                    }
                    self.tblApplyVoucher.vouchersArr = self.arrVoucher
                }
            }
            DispatchQueue.main.async {
                self.tblApplyVoucher.reloadData()
            }
        }
        
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
