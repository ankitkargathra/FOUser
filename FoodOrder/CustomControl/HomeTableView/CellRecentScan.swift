//
//  CellRecentScan.swift
//  FoodOrder
//
//  Created by Solulab_Vicky on 23/01/19.
//  Copyright © 2019 Ankit Kargathra. All rights reserved.
//

import UIKit

class CellRecentScan: UICollectionViewCell {
    
    @IBOutlet weak var lblRestautantName: UILabel!
    @IBOutlet weak var btnOrderNow: UIButton!
    @IBOutlet weak var viewCellBackground: UIView!
    
    var colors = [#colorLiteral(red: 0.9098039216, green: 0.1960784314, blue: 0.1960784314, alpha: 1), #colorLiteral(red: 0.1725490196, green: 0.7647058824, blue: 0.9843137255, alpha: 1), #colorLiteral(red: 0.9843137255, green: 0.7843137255, blue: 0.1058823529, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.8470588235, blue: 0.4274509804, alpha: 1), #colorLiteral(red: 0.7647058824, green: 0.1019607843, blue: 0.9843137255, alpha: 1)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnOrderNowPressed(_ sender: UIButton) {
        
        AppDel.FoodCourtId = sender.tag
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getorderNow"), object: nil)
    
    }
    
    func cellData(RS:RecentScan, Index:Int){
        
        lblRestautantName.text = RS.name
        viewCellBackground.backgroundColor = colors[Index % colors.count]
    }
}
