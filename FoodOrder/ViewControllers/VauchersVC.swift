//
//  VauchersVC.swift
//  FoodOrder
//
//  Created by Rohan on 07/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class VauchersVC: BaseVC {

    @IBOutlet weak var tbtVaucher: TableViewVaucher!
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "My Vouchers", subtitle: nil)
        super.viewDidLoad()
        
        tbtVaucher.blockTableViewDidSelectAtIndexPath = { (indexpath) in
            let cartVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "VoucherDetailVC")
            self.navigationController?.pushViewController(cartVC, animated: true)
        }

        // Do any additional setup after loading the view.
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
