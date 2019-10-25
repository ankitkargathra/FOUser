//
//  CardDetailVC.swift
//  FoodOrder
//
//  Created by Rohan on 28/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class CardDetailVC: BaseVC {

    override func viewDidLoad() {
        self.setNavigationButton(type: .BackBlack)
        self.addTitleView(title: "Card Detail", subtitle: "2 Items, To pay $ 22")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOrderPress() {
        let orderPlacedVC = MAIN_STORYBOARD.instantiateViewController(withIdentifier: "OrderSummaryVC") as! OrderSummaryVC
        self.navigationController?.present(orderPlacedVC, animated: true, completion: nil)
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
