//
//  PaymentVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class PaymentVC: BaseVC {

    @IBOutlet var tblPayment: TableViewPayment!
    
    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Payment", subtitle: "2 Items, To pay $ 22")
        super.viewDidLoad()

        tblPayment.blockTableViewDidSelectAtIndexPath = { (indexpath, cell) in
            if cell == PaymentcellType.CellPayment {
                let cardVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "CardDetailVC") as! CardDetailVC
                self.navigationController?.pushViewController(cardVC, animated: true)
            }
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
