//
//  MyCartVC.swift
//  FoodOrder
//
//  Created by Rohan on 19/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit


class MyCartVC: BaseVC, ApplyVoucherDelegate {

    @IBOutlet var tblMyCart: TableViewMyCart!
    @IBOutlet var emptyCartView: UIView!
    
    var hideViewEmpty: Bool = false

    
    override func viewDidLoad() {
        
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "My Cart", subtitle: nil)
        super.viewDidLoad()
        
        emptyCartView.isHidden = !(CartData.shared.items.count == 0)
        
        tblMyCart.blockTableViewDidSelectAtIndexPath =  { (indexpath, cell) in
            
            if cell == MyCartCellType.cellCouponCode {
                let applyCpnVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "ApplyVoucherVC") as! ApplyVoucherVC
                applyCpnVC.delegate = self
                self.navigationController?.pushViewController(applyCpnVC, animated: true)
            }
        }
        // Do any additional setup after loading the view.
        self.tblMyCart.reloadData()
    }
    
    @IBAction func btnProccedToPay() {
        let paymentVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }
    
    func getSelectedVoucher(voucher: Voucher) {
        tblMyCart.voucherApplied = true
        CartData.shared.discount = voucher.discount!
        tblMyCart.reloadData()
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
