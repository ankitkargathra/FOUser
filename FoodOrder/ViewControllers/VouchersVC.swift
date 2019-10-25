//
//  VauchersVC.swift
//  FoodOrder
//
//  Created by Rohan on 07/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class VouchersVC: BaseVC {

    @IBOutlet weak var tbtVaucher: TableViewVaucher!
    
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "My Vouchers", subtitle: nil)
        super.viewDidLoad()
        
        tbtVaucher.blockTableViewDidSelectAtIndexPath = { (indexpath) in
            let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "VoucherDetailVC") as! VoucherDetailVC
            cartVC.voucher = self.tbtVaucher.arrVoucher[indexpath.row]
            self.navigationController?.pushViewController(cartVC, animated: true)
        }
        // Do any additional setup after loading the view.
        self.getvoucherData()
    }
    
    func getvoucherData() {
        
        UtilityClass.showHUD()
        ApiController.shared.getVoucers { (success, message, response) in
            UtilityClass.hideHUD()
            
            if success == true {
                if response != nil {
                    self.tbtVaucher.arrVoucher.removeAll()
                    for obj in response! {
                        let voucher = Voucher.init(fromDictionary: obj)
                        if voucher.isReedem == "0"{
                            self.tbtVaucher.arrVoucher.append(voucher)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tbtVaucher.reloadData()
                }
            }else{
                self.tbtVaucher.isHidden = true
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
